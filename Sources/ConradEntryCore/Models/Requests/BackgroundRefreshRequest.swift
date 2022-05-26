//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct BackgroundRefreshRequest: Codable {
    public let shipments: [UUID: String]
    public let localAccountVersion: Date?

    public init(shipments: [UUID: String], localAccountVersion: Date?) {
        self.shipments = shipments
        self.localAccountVersion = localAccountVersion
    }
}
