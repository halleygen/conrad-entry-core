//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct DischargeWeightDTO: Codable, Hashable, Identifiable {
    public let id: UUID?
    public let methodID: Int
    public let startTime: Date
    public let finishTime: Date
    public let wetMetricTonnes: Double
    public let moisturePercentage: Double
    public let dryMetricTonnes: Double
    public let isSettlementWeight: Bool
    public let equipmentName: String?
    public let equipmentModel: String?
    public let equipmentCertificationDate: Date?
    public let calibrationCheck: CalibrationCheck?
    public let abcCheck: ABCCheck?
    public let comments: String

    public init(id: UUID?, methodID: Int, startTime: Date, finishTime: Date, wetMetricTonnes: Double, moisturePercentage: Double, dryMetricTonnes: Double, isSettlementWeight: Bool, equipmentName: String?, equipmentModel: String?, equipmentCertificationDate: Date?, calibrationCheck: CalibrationCheck?, abcCheck: ABCCheck?, comments: String) {
        self.id = id
        self.methodID = methodID
        self.startTime = startTime
        self.finishTime = finishTime
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
        self.isSettlementWeight = isSettlementWeight
        self.equipmentName = equipmentName
        self.equipmentModel = equipmentModel
        self.equipmentCertificationDate = equipmentCertificationDate
        self.calibrationCheck = calibrationCheck
        self.abcCheck = abcCheck
        self.comments = comments
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case methodID
        case startTime
        case finishTime
        case wetMetricTonnes
        case moisturePercentage
        case dryMetricTonnes
        case isSettlementWeight
        case equipmentName
        case equipmentModel
        case equipmentCertificationDate
        case calibrationCheck
        case abcCheck
        case comments
    }
}
