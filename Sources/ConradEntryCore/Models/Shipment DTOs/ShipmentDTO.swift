//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct ShipmentDTO: Codable, Hashable, Identifiable {
    public let id: UUID?
    public let shipmentDate: Date
    public let norTime: Date
    public let vesselName: String
    public let clientID: Int
    public let traderID: Int?
    public let smelterID: Int
    public let dischargePortID: Int
    public let inspectionCompanyIDs: Set<Int>
    public let conradTeamSize: Int
    public let comments: String
    public let createdAt: Date?
    public let updatedAt: Date?

    public let billOfLading: DatabaseDTO<UUID, BillOfLadingDTO>?
    public let dischargeWeights: [DischargeWeightDTO]
    public let discharge: DatabaseDTO<UUID, DischargeDTO>?
    public let sampleCollection: DatabaseDTO<UUID, SampleCollectionDTO>?
    public let sampleReduction: DatabaseDTO<UUID, SampleReductionDTO>?
    public let moistureDetermination: DatabaseDTO<UUID, MoistureDeterminationDTO>?
    public let qualityLotSamplePreparation: DatabaseDTO<UUID, QualityLotSamplePreparationDTO>?

    public init(id: UUID?, shipmentDate: Date, norTime: Date, vesselName: String, clientID: Int, traderID: Int?, smelterID: Int, dischargePortID: Int, inspectionCompanyIDs: Set<Int>, conradTeamSize: Int, comments: String, createdAt: Date?, updatedAt: Date?, billOfLading: DatabaseDTO<UUID, BillOfLadingDTO>?, dischargeWeights: [DischargeWeightDTO], discharge: DatabaseDTO<UUID, DischargeDTO>?, sampleCollection: DatabaseDTO<UUID, SampleCollectionDTO>?, sampleReduction: DatabaseDTO<UUID, SampleReductionDTO>?, moistureDetermination: DatabaseDTO<UUID, MoistureDeterminationDTO>?, qualityLotSamplePreparation: DatabaseDTO<UUID, QualityLotSamplePreparationDTO>?) {
        self.id = id
        self.shipmentDate = shipmentDate
        self.norTime = norTime
        self.vesselName = vesselName
        self.clientID = clientID
        self.traderID = traderID
        self.smelterID = smelterID
        self.dischargePortID = dischargePortID
        self.inspectionCompanyIDs = inspectionCompanyIDs
        self.conradTeamSize = conradTeamSize
        self.comments = comments
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.billOfLading = billOfLading
        self.dischargeWeights = dischargeWeights
        self.discharge = discharge
        self.sampleCollection = sampleCollection
        self.sampleReduction = sampleReduction
        self.moistureDetermination = moistureDetermination
        self.qualityLotSamplePreparation = qualityLotSamplePreparation
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case shipmentDate
        case norTime
        case vesselName
        case clientID
        case traderID
        case smelterID
        case dischargePortID
        case inspectionCompanyIDs
        case conradTeamSize
        case comments
        case createdAt
        case updatedAt
        case billOfLading
        case dischargeWeights
        case discharge
        case sampleCollection
        case sampleReduction
        case moistureDetermination
        case qualityLotSamplePreparation
    }
}
