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

public struct ShipmentRefreshRequest: Codable {
    public var shipmentID: UUID
    public var detailsVersion: Date
    public var billOfLadingVersion: Date?
    public var dischargeVersion: Date?
    public var settlementWeightVersion: Date?
    public var referenceWeightVersion: Date?
    public var sampleCollectionVersion: Date?
    public var sampleReductionVersion: Date?
    public var moistureDeterminationVersion: Date?
    public var samplePreparationVersion: Date?

    public init(shipmentID: UUID, detailsVersion: Date, billOfLadingVersion: Date? = nil, dischargeVersion: Date? = nil, settlementWeightVersion: Date? = nil, referenceWeightVersion: Date? = nil, sampleCollectionVersion: Date? = nil, sampleReductionVersion: Date? = nil, moistureDeterminationVersion: Date? = nil, samplePreparationVersion: Date? = nil) {
        self.shipmentID = shipmentID
        self.detailsVersion = detailsVersion
        self.billOfLadingVersion = billOfLadingVersion
        self.dischargeVersion = dischargeVersion
        self.settlementWeightVersion = settlementWeightVersion
        self.referenceWeightVersion = referenceWeightVersion
        self.sampleCollectionVersion = sampleCollectionVersion
        self.sampleReductionVersion = sampleReductionVersion
        self.moistureDeterminationVersion = moistureDeterminationVersion
        self.samplePreparationVersion = samplePreparationVersion
    }
}
