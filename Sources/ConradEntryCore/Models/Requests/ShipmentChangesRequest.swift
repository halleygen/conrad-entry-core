//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct ShipmentChangesRequest: Codable {
    public let partID: UUID
    public let date: Date?

    public init(partID: UUID, date: Date?) {
        self.partID = partID
        self.date = date
    }

    public enum CodingKeys: CodingKey {
        case partID
        case date
    }

    public func queryItems() -> [URLQueryItem] {
        [
            URLQueryItem(name: CodingKeys.partID.stringValue, value: partID.uuidString),
            URLQueryItem(name: CodingKeys.date.stringValue, value: (date?.timeIntervalSince1970).map(String.init(_:)))
        ]
    }
}
