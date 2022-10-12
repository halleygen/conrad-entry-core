//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct EntityTag: Hashable {
    public enum Validator {
        case strong, weak
    }

    public let value: String
    public let validator: Validator

    public init(value: String, validator: Validator) {
        self.value = value
        self.validator = validator
    }

    public func matches(_ other: Self, using validator: Validator) -> Bool {
        switch validator {
        case .strong:
            switch (validator, other.validator) {
            case (.strong, .strong): return value == other.value
            default: return false
            }

        case .weak:
            return value == other.value
        }
    }
}

public extension EntityTag {
    init?(_ value: some EntityTagConvertible) {
        guard let entityTag = value.entityTag else { return nil }
        self = entityTag
    }

    static func strongValidator(_ value: String) -> Self {
        Self(value: value, validator: .strong)
    }

    static func weakValidator(_ value: String) -> Self {
        Self(value: value, validator: .weak)
    }
}

extension EntityTag: LosslessStringConvertible {
    public init?(_ description: String) {
        guard description.hasSuffix("\"") else { return nil }

        let valueEndIndex = description.index(before: description.endIndex)
        if description.hasPrefix("W/\"") {
            guard let valueStartIndex = description.index(description.startIndex, offsetBy: 3, limitedBy: valueEndIndex) else { return nil }
            self.init(value: String(description[valueStartIndex ..< valueEndIndex]), validator: .weak)
        } else if description.hasPrefix("\"") {
            guard let valueStartIndex = description.index(description.startIndex, offsetBy: 1, limitedBy: valueEndIndex) else { return nil }
            self.init(value: String(description[valueStartIndex ..< valueEndIndex]), validator: .strong)
        } else {
            return nil
        }
    }

    public var description: String {
        switch validator {
        case .strong: return "\"\(value)\""
        case .weak: return "W/\"\(value)\""
        }
    }
}
