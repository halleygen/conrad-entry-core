//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct BackgroundRefreshRequest: Codable {
    public let shipments: [UUID: Date]

    public init(shipments: [UUID: Date]) {
        self.shipments = shipments
    }
}
