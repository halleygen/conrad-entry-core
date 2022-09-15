//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct ShipmentChangesRequest: Codable {
    public let date: Date?

    public init(date: Date?) {
        self.date = date
    }

    public enum CodingKeys: CodingKey {
        case date
    }

    public func queryItems() -> [URLQueryItem] {
        [
            URLQueryItem(name: CodingKeys.date.stringValue, value: (date?.timeIntervalSince1970).map(String.init(_:)))
        ]
    }
}
