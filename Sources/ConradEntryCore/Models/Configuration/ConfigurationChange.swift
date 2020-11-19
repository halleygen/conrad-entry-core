//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

 public extension RemoteConfiguration {
    struct Change: Codable {
        public let schema: String
        public let data: Data
        public let operation: Operation
        
        public init(schema: String, data: Data, operation: Operation) {
            self.schema = schema
            self.data = data
            self.operation = operation
        }
    }
 }

 public extension RemoteConfiguration.Change {
    enum Operation: Codable {
        case add, update(primaryKey: Int)
        
        public enum CodingKeys: String, CodingKey {
            case add, update
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            if container.contains(.add) {
                self = .add
            } else if let primaryKey = try container.decodeIfPresent(Int.self, forKey: .update) {
                self = .update(primaryKey: primaryKey)
            } else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Container did not contain either add or update key."))
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch self {
            case .add: try container.encodeNil(forKey: .add)
            case .update(let primaryKey): try container.encode(primaryKey, forKey: .update)
            }
        }
    }
 }

 extension RemoteConfiguration.Change: CustomStringConvertible {
    public var description: String {
        "ConfigurationChange: \(operation) in table '\(schema)'"
    }
 }
