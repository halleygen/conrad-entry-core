//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct DischargeWeightDTO: DischargeWeightProtocol, APIResponseItem, ShipmentChildDTO {
    public let id: UUID
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
    public let createdAt: Date
    public let updatedAt: Date

    public var version: Date { updatedAt }

    public init(id: ID, kind: DischargeWeightKind, methodID: Int, weighingPointID: Int, weighingCompany: String, startTime: Date, finishTime: Date, wetMetricTonnes: Double, moisturePercentage: Double, dryMetricTonnes: Double, equipmentName: String?, equipmentModel: String?, equipmentLocation: LocationDTO?, equipmentCertificationDate: Date?, calibrationCheck: CalibrationCheck?, abcCheck: ABCCheck?, tallymen: Tallymen?, transparencyID: Int, comments: [String], createdAt: Date, updatedAt: Date) {
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

    public init(_ other: DischargeWeightProtocol, id: ID, createdAt: Date, updatedAt: Date) {
        self.init(id: id, kind: other.kind, methodID: other.methodID, weighingPointID: other.weighingPointID, weighingCompany: other.weighingCompany, startTime: other.startTime, finishTime: other.finishTime, wetMetricTonnes: other.wetMetricTonnes, moisturePercentage: other.moisturePercentage, dryMetricTonnes: other.dryMetricTonnes, equipmentName: other.equipmentName, equipmentModel: other.equipmentModel, equipmentLocation: other.equipmentLocation, equipmentCertificationDate: other.equipmentCertificationDate, calibrationCheck: other.calibrationCheck, abcCheck: other.abcCheck, tallymen: other.tallymen, transparencyID: other.transparencyID, comments: other.comments, createdAt: createdAt, updatedAt: updatedAt)
    }

    public func eraseToAnyDTO() -> AnyShipmentChildDTO {
        .dischargeWeight(dischargeWeight: self)
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
