//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public enum ETag: Hashable {
    case strongValidator(String)
    case weakValidator(String)
    case catchAll

    public init<Value: ETagConvertible>(_ value: Value) {
        self = value.eTag
    }

    public var value: String {
        switch self {
        case let .strongValidator(string): return string
        case let .weakValidator(string): return string
        case .catchAll: return "*"
        }
    }
}

public extension ETag {
    static func fromResource(_ resource: some VersionedResource) -> Self {
        resource.version.eTag
    }
}

extension ETag: LosslessStringConvertible {
    public init?(_ description: String) {
        guard description.hasSuffix("\"") else {
            if description == "*" {
                self = .catchAll
                return
            }

            return nil
        }

        let valueEndIndex = description.index(before: description.endIndex)

        if description.hasPrefix("W/\"") {
            guard let valueStartIndex = description.index(description.startIndex, offsetBy: 3, limitedBy: valueEndIndex) else { return nil }
            let value = String(description[valueStartIndex ..< valueEndIndex])
            self = .weakValidator(value)
        } else if description.hasPrefix("\"") {
            guard let valueStartIndex = description.index(description.startIndex, offsetBy: 1, limitedBy: valueEndIndex) else { return nil }
            let value = String(description[valueStartIndex ..< valueEndIndex])
            self = .strongValidator(value)
        } else {
            return nil
        }
    }

    public var description: String {
        switch self {
        case let .strongValidator(value):
            return #""\#(value)""#
        case let .weakValidator(value):
            return #"W/"\#(value)""#
        case .catchAll:
            return "*"
        }
    }
}
