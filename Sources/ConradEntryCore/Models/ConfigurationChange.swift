//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public extension RemoteConfiguration {
    struct Change: Codable {
        public let key: String
        public let data: Data
        public let operation: Operation

        public static func deleting(_ data: Data, fromItemNamed key: String) -> ConfigurationChange {
            self.init(key: key, data: data, operation: .delete)
        }

        public static func updating(_ data: Data, fromItemNamed key: String) -> ConfigurationChange {
            self.init(key: key, data: data, operation: .update)
        }
    }
}

public extension RemoteConfiguration.Change {
    enum Operation: String, Codable {
        case update, delete
    }
}

extension RemoteConfiguration.Change: CustomStringConvertible {
    public var description: String {
        "ConfigurationChange: \(operation) \"\(String(data: data, encoding: .utf8) ?? "[corrupted data]")\" from table '\(key)'"
    }
}
