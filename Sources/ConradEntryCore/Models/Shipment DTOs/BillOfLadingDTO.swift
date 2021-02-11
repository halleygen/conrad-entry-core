//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct BillOfLadingDTO: Codable, Hashable, Identifiable {
    public let id: UUID?
    public let loadPortID: Int
    public let vesselHolds: Set<Int>
    public let weighingMethodID: Int
    public let wetMetricTonnes: Double
    public let moisturePercentage: Double?
    public let dryMetricTonnes: Double?
    public let comments: [String]

    public init(id: UUID?, loadPortID: Int, vesselHolds: Set<Int>, weighingMethodID: Int, wetMetricTonnes: Double, moisturePercentage: Double?, dryMetricTonnes: Double?, comments: [String]) {
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
