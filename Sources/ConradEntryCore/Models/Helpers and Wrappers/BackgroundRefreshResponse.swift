//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct BackgroundRefreshResponse: Codable {
    public let shipments: [ShipmentDTO]
    public let account: PublicUser

    public init(shipments: [ShipmentDTO], account: PublicUser) {
        self.shipments = shipments
        self.account = account
    }
}
