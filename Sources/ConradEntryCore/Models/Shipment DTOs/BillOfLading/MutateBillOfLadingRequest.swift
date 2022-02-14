//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct MutateBillOfLadingRequest: BillOfLadingProtocol, Codable {
    public typealias ID = UUID?

    public let id: ID
    public let loadPortID: Int
    public let vesselHolds: Set<Int>
    public let weighingMethodID: Int
    public let wetMetricTonnes: Double
    public let moisturePercentage: Double
    public let dryMetricTonnes: Double
    public let comments: [String]

    public init(id: ID = nil, loadPortID: Int, vesselHolds: Set<Int>, weighingMethodID: Int, wetMetricTonnes: Double, moisturePercentage: Double, dryMetricTonnes: Double, comments: [String]) {
        self.id = id
        self.loadPortID = loadPortID
        self.vesselHolds = vesselHolds
        self.weighingMethodID = weighingMethodID
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
        self.comments = comments
    }

    public init(_ other: BillOfLadingProtocol, id: ID = nil) {
        self.init(id: id, loadPortID: other.loadPortID, vesselHolds: other.vesselHolds, weighingMethodID: other.weighingMethodID, wetMetricTonnes: other.wetMetricTonnes, moisturePercentage: other.moisturePercentage, dryMetricTonnes: other.dryMetricTonnes, comments: other.comments)
    }
}
