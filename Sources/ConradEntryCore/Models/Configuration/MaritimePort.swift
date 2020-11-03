//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct MaritimePort: Hashable, Codable, Identifiable {
    public let id: UUID
    public let name: String
    public let countryCode: String
    public let timeZoneIdentifier: String

    public var flag: String {
        countryCode.unicodeScalars.reduce(into: "") { result, scalar in
            result.unicodeScalars.append(Unicode.Scalar(0x1F1A5 &+ scalar.value)!)
        }
    }

    public var timeZone: TimeZone { TimeZone(identifier: timeZoneIdentifier)! }

    public init(id: UUID, name: String, countryCode: String, timeZoneIdentifier: String) {
        precondition(TimeZone(identifier: timeZoneIdentifier) != nil, "Port initialized with invalid time zone identifier.")
        self.id = id
        self.name = name
        self.countryCode = countryCode
        self.timeZoneIdentifier = timeZoneIdentifier
    }
}

public extension MaritimePort {
    enum CodingKeys: String, CodingKey {
        case id, name, countryCode, timeZoneIdentifier
    }
}

extension MaritimePort: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        "\(name), \(countryCode) (\(timeZoneIdentifier))"
    }

    public var debugDescription: String {
        "[\(id)] " + description
    }
}
