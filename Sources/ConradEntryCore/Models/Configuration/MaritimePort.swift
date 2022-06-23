//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct MaritimePort: ConfigurationConstant {
    public let id: Int
    public let value: String
    public let countryCode: String
    public let timeZoneIdentifier: String
    public let isSoftDeleted: Bool

    public var representsOtherValue: Bool { false }

    public var flag: String {
        countryCode.unicodeScalars.reduce(into: "") { result, scalar in
            result.unicodeScalars.append(Unicode.Scalar(0x1F1A5 &+ scalar.value)!)
        }
    }

    public var timeZone: TimeZone { TimeZone(identifier: timeZoneIdentifier)! }

    public init(id: Int, name: String, countryCode: String, timeZoneIdentifier: String, isSoftDeleted: Bool) {
        precondition(TimeZone(identifier: timeZoneIdentifier) != nil, "Port initialized with invalid time zone identifier.")
        self.id = id
        self.value = name
        self.countryCode = countryCode
        self.timeZoneIdentifier = timeZoneIdentifier
        self.isSoftDeleted = isSoftDeleted
    }
}

public extension MaritimePort {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id, value, countryCode, timeZoneIdentifier, isSoftDeleted
    }
}

extension MaritimePort: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        "\(value), \(countryCode) (\(timeZoneIdentifier))"
    }

    public var debugDescription: String {
        "[ID:\(id)] " + description
    }
}
