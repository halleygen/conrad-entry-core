//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct BackgroundRefreshRequest: Codable {
    public let shipments: [UUID: Date]
    public let account: Bool

    public init(shipments: [UUID: Date], account: Bool = true) {
        self.shipments = shipments
        self.account = account
    }
}
