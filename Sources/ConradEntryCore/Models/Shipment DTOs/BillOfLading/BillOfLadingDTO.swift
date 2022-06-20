//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct BillOfLadingDTO: BillOfLadingProtocol, APIResponseItem, ShipmentChildDTO {
    public let id: UUID
    public let loadPortID: Int
    public let vesselHolds: Set<Int>
    public let weighingMethodID: Int
    public let wetMetricTonnes: Double
    public let moisturePercentage: Double
    public let dryMetricTonnes: Double
    public let comments: [String]
    public let createdAt: Date
    public let updatedAt: Date

    public var version: Date { updatedAt }

    public init(id: ID, loadPortID: Int, vesselHolds: Set<Int>, weighingMethodID: Int, wetMetricTonnes: Double, moisturePercentage: Double, dryMetricTonnes: Double, comments: [String], createdAt: Date, updatedAt: Date) {
        self.id = id
        self.loadPortID = loadPortID
        self.vesselHolds = vesselHolds
        self.weighingMethodID = weighingMethodID
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
        self.comments = comments
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public init(_ other: BillOfLadingProtocol, id: ID, createdAt: Date, updatedAt: Date) {
        self.init(id: id, loadPortID: other.loadPortID, vesselHolds: other.vesselHolds, weighingMethodID: other.weighingMethodID, wetMetricTonnes: other.wetMetricTonnes, moisturePercentage: other.moisturePercentage, dryMetricTonnes: other.dryMetricTonnes, comments: other.comments, createdAt: createdAt, updatedAt: updatedAt)
    }

    public func eraseToAnyDTO() -> AnyShipmentChildDTO {
        .billOfLading(billOfLading: self)
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case loadPortID
        case vesselHolds
        case weighingMethodID
        case wetMetricTonnes
        case moisturePercentage
        case dryMetricTonnes
        case comments
        case createdAt
        case updatedAt
    }
}
