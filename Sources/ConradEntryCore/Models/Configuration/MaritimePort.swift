//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public extension MaritimePortValue {
    var flagEmoji: String {
        countryCode.unicodeScalars.reduce(into: "") { result, scalar in
            result.unicodeScalars.append(Unicode.Scalar(0x1F1A5 &+ scalar.value)!)
        }
    }

    var timeZone: TimeZone { TimeZone(identifier: timeZoneIdentifier)! }
}

extension MaritimePortValue: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        "\(value), \(countryCode) (\(timeZoneIdentifier))"
    }

    public var debugDescription: String {
        "[ID:\(id)] " + description
    }
}
