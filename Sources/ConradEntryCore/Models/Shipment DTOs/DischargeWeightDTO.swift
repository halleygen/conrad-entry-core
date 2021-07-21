//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct DischargeWeightDTO: Codable, Hashable, Identifiable, VersionedDTO {
    public let id: UUID?
    public let kind: DischargeWeightKind
    public let methodID: Int
    public let weighingPointID: Int
    public let weighingCompany: String
    public let startTime: Date
    public let finishTime: Date
    public let wetMetricTonnes: Double
    public let moisturePercentage: Double
    public let dryMetricTonnes: Double
    public let equipmentName: String?
    public let equipmentModel: String?
    public let equipmentLocation: LocationDTO?
    public let equipmentCertificationDate: Date?
    public let calibrationCheck: CalibrationCheck?
    public let abcCheck: ABCCheck?
    public let tallymen: Tallymen?
    public let transparencyID: Int
    public let comments: [String]
    public let createdAt: Date?
    public let updatedAt: Date?

    public var isSettlementWeight: Bool { kind == .settlement }
    public var isReferenceWeight: Bool { kind == .reference }

    public init(id: UUID?, kind: DischargeWeightKind, methodID: Int, weighingPointID: Int, weighingCompany: String, startTime: Date, finishTime: Date, wetMetricTonnes: Double, moisturePercentage: Double, dryMetricTonnes: Double, equipmentName: String?, equipmentModel: String?, equipmentLocation: LocationDTO?, equipmentCertificationDate: Date?, calibrationCheck: CalibrationCheck?, abcCheck: ABCCheck?, tallymen: Tallymen?, transparencyID: Int, comments: [String], createdAt: Date?, updatedAt: Date?) {
        self.id = id
        self.kind = kind
        self.methodID = methodID
        self.weighingPointID = weighingPointID
        self.weighingCompany = weighingCompany
        self.startTime = startTime
        self.finishTime = finishTime
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
        self.equipmentName = equipmentName
        self.equipmentModel = equipmentModel
        self.equipmentLocation = equipmentLocation
        self.equipmentCertificationDate = equipmentCertificationDate
        self.calibrationCheck = calibrationCheck
        self.abcCheck = abcCheck
        self.tallymen = tallymen
        self.transparencyID = transparencyID
        self.comments = comments
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case kind
        case methodID
        case weighingPointID
        case weighingCompany
        case startTime
        case finishTime
        case wetMetricTonnes
        case moisturePercentage
        case dryMetricTonnes
        case equipmentName
        case equipmentModel
        case equipmentLocation
        case equipmentCertificationDate
        case calibrationCheck
        case abcCheck
        case tallymen
        case transparencyID
        case comments
        case createdAt
        case updatedAt
    }
}
