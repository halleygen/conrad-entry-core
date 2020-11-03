//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct ShipmentDTO: Codable {
    public let id: UUID?
    public let shipmentDate: Date
    public let norTime: Date
    public let vesselName: String
    public let clientID: UUID
    public let traderID: UUID?
    public let smelterID: UUID
    public let dischargePortID: UUID
    public let inspectionCompanyIDs: Set<UUID>
    public let conradTeamSize: Int
    public let comments: String
    public let createdAt: Date?
    public let updatedAt: Date?

    public let billOfLading: BillOfLadingDTO
    public let dischargeWeights: [DischargeWeightDTO]
    public let discharge: DischargeDTO
    public let sampleCollection: SampleCollectionDTO
    public let sampleReduction: SampleReductionDTO
    public let moistureDetermination: MoistureDeterminationDTO
    public let qualityLotSamplePreparation: QualityLotSamplePreparationDTO

    public init(id: UUID?, shipmentDate: Date, norTime: Date, vesselName: String, clientID: UUID, traderID: UUID?, smelterID: UUID, dischargePortID: UUID, inspectionCompanyIDs: Set<UUID>, conradTeamSize: Int, comments: String, createdAt: Date?, updatedAt: Date?, billOfLading: BillOfLadingDTO, dischargeWeights: [DischargeWeightDTO], discharge: DischargeDTO, sampleCollection: SampleCollectionDTO, sampleReduction: SampleReductionDTO, moistureDetermination: MoistureDeterminationDTO, qualityLotSamplePreparation: QualityLotSamplePreparationDTO) {
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
