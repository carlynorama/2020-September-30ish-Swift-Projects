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

let group = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)

let bootstrap = ServerBootstrap(group: group)
  // Specifies that we can have 256 TCP sockets waiting to be accepted for processing at a given time
  .serverChannelOption(ChannelOptions.backlog, value: 256)
  // Allows reusing the IP address and port so that multiple threads can receive clients
  .serverChannelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
  
  // Sets up the HTTP parser and handler on the SwiftNIO channel
  .childChannelInitializer { channel in
    channel.pipeline.configureHTTPServerPipeline(withErrorHandling: true).then {
      channel.pipeline.add(handler: HTTPHandler(responder: QuoteResponder()))
    }
}

// The host and port to which the webserver will bind
// ::1 can usually be accessed as `localhost`
// The difference is that `::1` is also available from other computers
let host = "::1"
let port = 8080

let serverChannel = try bootstrap.bind(host: host, port: port).wait()

guard serverChannel.localAddress != nil else {
  fatalError("Unable to bind to \(host) at port \(port)")
}

print("Server started and listening")

try serverChannel.closeFuture.wait()
