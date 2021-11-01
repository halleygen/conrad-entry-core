//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public enum ETag: Hashable {
    case strongValidator(String)
    case weakValidator(String)
    case catchAll
}

public extension ETag {
    init<T: ETagConvertible>(_ value: T) {
        self = .strongValidator(value.eTagValue)
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

        if description.hasPrefix("W/") {
            guard let valueStartIndex = description.index(description.startIndex, offsetBy: 3, limitedBy: valueEndIndex) else { return nil }
            let value = String(description[valueStartIndex ..< valueEndIndex])
            guard !value.isEmpty else { return nil }
            self = .weakValidator(value)
        } else if description.hasPrefix("\"") {
            guard let valueStartIndex = description.index(description.startIndex, offsetBy: 1, limitedBy: valueEndIndex) else { return nil }
            let value = String(description[valueStartIndex ..< valueEndIndex])
            guard !value.isEmpty else { return nil }
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
