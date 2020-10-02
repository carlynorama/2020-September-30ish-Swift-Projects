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
import Foundation

/// Entities that can be stored in the mock database provided below
public protocol DatabaseEntity {
  associatedtype Identifier: Equatable

  /// The identifier of this Entity
  ///
  /// Used for `find` and `delete` operations
  var id: Identifier { get }
}

/// A mock database generic to a single DatabaseEntity type
///
/// All results are returned by completing the provided promise
/// This ensures that the results are passed to the EventLoop the EventLoopPromise originated from
public final class Database<Entity: DatabaseEntity> {
  /// The database has it's own eventloop because it's shared between many threads
  ///
  /// To ensure all entity access is thread safe, all operations happen on this EventLoop
  private let eventLoop: EventLoop

  /// The internal storage of the mock database
  private var entities = [Entity]()

  /// Lists all entities in the database and returns them by completing the promise with this result
  public func getAllEntities(completing promise: EventLoopPromise<[Entity]>) {
    eventLoop.execute {
      promise.succeed(result: self.entities)
    }
  }

  /// Deletes a single entity
  ///
  /// Succeeds when the deletion was successful and fails if no entity was found to remove
  public func deleteOne(by id: Entity.Identifier, completing promise: EventLoopPromise<Void>) {
    eventLoop.execute {
      for i in 0..<self.entities.count {
        if self.entities[i].id == id {
          self.entities.remove(at: i)
          promise.succeed(result: ())
          return
        }
      }

      promise.fail(error: DatabaseError.entityNotFound)
    }
  }

  /// Finds a single entity by it's identifier and completed the promise with the result
  ///
  /// The promise will be completed with `nil` if the entity was not found
  public func findOne(by id: Entity.Identifier, completing promise: EventLoopPromise<Entity?>) {
    eventLoop.execute {
      for entity in self.entities where entity.id == id {
        promise.succeed(result: entity)
        return
      }

      promise.succeed(result: nil)
    }
  }

  /// Adds an entity to the database
  ///
  /// This operation can fail if an entity with this ID already exists
  public func addEntity(_ newEntity: Entity, completing promise: EventLoopPromise<Void>) {
    eventLoop.execute {
      for entity in self.entities {
        if entity.id == newEntity.id {
          promise.fail(error: DatabaseError.entityAlreadyExists)
          return
        }
      }

      self.entities.append(newEntity)
      promise.succeed(result: ())
    }
  }

  /// Creates a new mock database for storing the generic `Entity`
  public init() {
    eventLoop = MultiThreadedEventLoopGroup(numberOfThreads: 1).next()
  }
}

/// The databsae can fail with these status codes
///
/// Most databases will have too many errors to sum up simply in an enum
/// and are implemented outside of the application's access
fileprivate enum DatabaseError: Error {
  case entityAlreadyExists
  case entityNotFound
}
