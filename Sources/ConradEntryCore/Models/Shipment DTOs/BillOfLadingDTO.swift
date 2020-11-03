//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct BillOfLadingDTO: Codable {
    public let id: UUID?
    public let loadPortID: UUID
    public let vesselHolds: Set<Int>
    public let weighingMethodID: UUID
    public let wetMetricTonnes: Double
    public let moisturePercentage: Double
    public let dryMetricTonnes: Double
    public let comments: String

    public init(id: UUID?, loadPortID: UUID, vesselHolds: Set<Int>, weighingMethodID: UUID, wetMetricTonnes: Double, moisturePercentage: Double, dryMetricTonnes: Double, comments: String) {
        self.id = id
        self.loadPortID = loadPortID
        self.vesselHolds = vesselHolds
        self.weighingMethodID = weighingMethodID
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
        self.comments = comments
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
    }
}
