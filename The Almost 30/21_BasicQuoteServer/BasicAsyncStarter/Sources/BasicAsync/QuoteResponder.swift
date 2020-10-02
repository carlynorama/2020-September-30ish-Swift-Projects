/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import NIO
import NIOHTTP1
import Foundation

struct QuoteResponder: HTTPResponder {
    
    func respond(to request: HTTPRequest) -> EventLoopFuture<HTTPResponse> {
        switch request.head.method {
        case .GET:
            guard request.head.uri != "/" else {
                return listQuotes(for: request)
            }
            
            let components = request.head.uri.split(separator: "/", maxSplits: .max, omittingEmptySubsequences: true)
            guard let component = components.first, components.count == 1 else {
                return request.eventLoop.newFailedFuture(error: QuoteAPIError.notFound)
            }
            let id = String(component)
            return getQuote(by: id, for: request)
            
        case .POST:
            return createQuote(from: request)
            
        case .DELETE:
          let components = request.head.uri.split(separator: "/", maxSplits: .max, omittingEmptySubsequences: true)
          guard components.count == 1,
            let component = components.first else {
              return request.eventLoop.newFailedFuture(error: QuoteAPIError.notFound)
          }
          let id = String(component)
          return deleteQuote(by: id, for: request)
            
        default:
            // 4
            let notFound = HTTPResponse(status: .notFound, body: HTTPBody(text: "Not found"))
            return request.eventLoop.newSucceededFuture(result: notFound)
        }
    }
    
    let quoteRepository = ThreadSpecificVariable<QuoteRepository>()
    
    func makeQuoteRepository(for request: HTTPRequest) -> QuoteRepository {
        // 2
        if let existingQuoteRepository = quoteRepository.currentValue {
            return existingQuoteRepository
        }
        
        // 3
        let newQuoteRepository = QuoteRepository(for: request.eventLoop)
        quoteRepository.currentValue = newQuoteRepository
        return newQuoteRepository
    }
    
    private func listQuotes(for request: HTTPRequest) -> EventLoopFuture<HTTPResponse> {
        // 1
        let repository = makeQuoteRepository(for: request)
        
        // 2
        return repository.fetchAllQuotes().thenThrowing { quotes in
            // 3
            let body = try HTTPBody(json: quotes, pretty: true)
            return HTTPResponse(status: .ok, body: body)
        }
    }
    
    private func createQuote(from request: HTTPRequest) -> EventLoopFuture<HTTPResponse> {
        // 1
        guard let body = request.body else {
            return request.eventLoop.newFailedFuture(error: QuoteAPIError.badRequest)
        }
        
        do {
            // 2
            let quoteRequest = try body.decodeJSON(as: QuoteRequest.self)
            let quote = Quote(id: UUID(), text: quoteRequest.text)
            
            // 3
            let repository = makeQuoteRepository(for: request)
            
            // 4
            return repository.insert(quote).thenThrowing {
                let body = try HTTPBody(json: quote, pretty: true)
                return HTTPResponse(status: .ok, body: body)
            }
        } catch {
            // 5
            return request.eventLoop.newFailedFuture(error: error)
        }
    }
    
    private func getQuote(by id:String, for request: HTTPRequest) -> EventLoopFuture<HTTPResponse> {
        guard let id = UUID(uuidString: id) else {
            return request.eventLoop.newFailedFuture(error: QuoteAPIError.invalidIdentifier)
        }
        
        let repository = makeQuoteRepository(for: request)
        return repository.fetchOne(by: id).thenThrowing {
            quote in
            guard let quote = quote else {
                throw QuoteAPIError.notFound
            }
            
            let body = try HTTPBody(json: quote, pretty: true)
            return HTTPResponse(status: .ok, body: body)
        }
    }
    
    private func deleteQuote(by id: String, for request: HTTPRequest)
      -> EventLoopFuture<HTTPResponse> {
        guard let id = UUID(uuidString: id) else {
          return request.eventLoop.newFailedFuture(error: QuoteAPIError.invalidIdentifier)
        }

        let repository = makeQuoteRepository(for: request)

        return repository.fetchOne(by: id).then { quote -> EventLoopFuture<HTTPResponse> in
          guard let quote = quote else {
            return request.eventLoop.newFailedFuture(error: QuoteAPIError.notFound)
          }

          return repository.deleteOne(by: id).thenThrowing {
            let body = try HTTPBody(json: quote, pretty: true)
            return HTTPResponse(status: .ok, body: body)
          }
        }
    }
    
}

enum QuoteAPIError: Error {
    case notFound, badRequest, invalidIdentifier
}

struct QuoteRequest: Codable {
    let text: String
}
