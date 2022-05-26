//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct BackgroundRefreshResponse: Codable {
    public let shipments: [VersionedValueOrID<ShipmentDTO>]
    public let account: PublicUser

    public init(shipments: [VersionedValueOrID<ShipmentDTO>], account: PublicUser) {
        self.shipments = shipments
        self.account = account
    }
}
