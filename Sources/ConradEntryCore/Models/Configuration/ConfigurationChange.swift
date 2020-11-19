//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public extension RemoteConfiguration {
    struct Change: Codable {
        public let schema: RemoteConfiguration.CodingKeys
        public let operation: Operation

        public init(schema: RemoteConfiguration.CodingKeys, operation: Operation) {
            self.schema = schema
            self.operation = operation
        }
    }
}

public extension RemoteConfiguration.Change {
    enum Operation: Codable {
        case add(Data), update(primaryKey: Int, Data), delete(primaryKey: Int)

        public enum CodingKeys: String, CodingKey {
            case primaryKey, data
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            let hasPrimaryKey = container.contains(.primaryKey)
            let hasData = container.contains(.data)

            switch (hasPrimaryKey, hasData) {
            case (true, false):
                let primaryKey = try container.decode(Int.self, forKey: .primaryKey)
                self = .delete(primaryKey: primaryKey)

            case (true, true):
                let primaryKey = try container.decode(Int.self, forKey: .primaryKey)
                let data = try container.decode(Data.self, forKey: .data)
                self = .update(primaryKey: primaryKey, data)

            case (false, true):
                let data = try container.decode(Data.self, forKey: .data)
                self = .add(data)

            case (false, false):
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Container did not contain either a primary key or data."))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch self {
            case let .add(data):
                try container.encode(data, forKey: .data)

            case let .update(primaryKey, data):
                try container.encode(primaryKey, forKey: .primaryKey)
                try container.encode(data, forKey: .data)

            case let .delete(primaryKey):
                try container.encode(primaryKey, forKey: .primaryKey)
            }
        }
    }
}

extension RemoteConfiguration.Change: CustomStringConvertible {
    public var description: String {
        "ConfigurationChange: \(operation) in table '\(schema)'"
    }
}
