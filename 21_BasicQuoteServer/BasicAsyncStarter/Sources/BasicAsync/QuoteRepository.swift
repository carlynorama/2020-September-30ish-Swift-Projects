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

struct Quote: Codable, DatabaseEntity {
    let id: UUID
    let text: String
}

public final class QuoteRepository {
    
    private static let database = Database<Quote>()
    let eventLoop: EventLoop
    
    public init(for eventLoop: EventLoop) {
        self.eventLoop = eventLoop
    }
    
    func insert(_ quote: Quote) -> EventLoopFuture<Void> {
      let promise = eventLoop.newPromise(of: Void.self)
      QuoteRepository.database.addEntity(quote, completing: promise)
      return promise.futureResult
    }
    
    func fetchAllQuotes() -> EventLoopFuture<[Quote]> {
      let promise = eventLoop.newPromise(of: [Quote].self)
      QuoteRepository.database.getAllEntities(completing: promise)
      return promise.futureResult
    }
    
    func fetchOne(by id: Quote.Identifier) -> EventLoopFuture<Quote?> {
        let promise = eventLoop.newPromise(of: Quote?.self)
        QuoteRepository.database.findOne(by: id, completing: promise)
        return promise.futureResult
    }
    
    func deleteOne(by id: Quote.Identifier) -> EventLoopFuture<Void> {
      let promise = eventLoop.newPromise(of: Void.self)
      QuoteRepository.database.deleteOne(by: id, completing: promise)
      return promise.futureResult
    }
    
}
