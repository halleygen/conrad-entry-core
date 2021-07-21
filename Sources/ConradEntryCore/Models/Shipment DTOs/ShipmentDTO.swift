//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct ShipmentDTO: Codable, Hashable, Identifiable, VersionedDTO {
    @inlinable
    public var id: UUID? { details.id }

    @inlinable
    public var updatedAt: Date? { details.updatedAt }

    @inlinable
    public var createdAt: Date? { details.updatedAt }

    public let details: ShipmentDetailsDTO
    public let billOfLading: DatabaseDTO<UUID, BillOfLadingDTO>?
    public let settlementWeight: DatabaseDTO<UUID, DischargeWeightDTO>?
    public let referenceWeight: DatabaseDTO<UUID, DischargeWeightDTO>?
    public let discharge: DatabaseDTO<UUID, DischargeDTO>?
    public let sampleCollection: DatabaseDTO<UUID, SampleCollectionDTO>?
    public let sampleReduction: DatabaseDTO<UUID, SampleReductionDTO>?
    public let moistureDetermination: DatabaseDTO<UUID, MoistureDeterminationDTO>?
    public let samplePreparation: DatabaseDTO<UUID, SamplePreparationDTO>?

    public init(details: ShipmentDetailsDTO, billOfLading: DatabaseDTO<UUID, BillOfLadingDTO>?, settlementWeight: DatabaseDTO<UUID, DischargeWeightDTO>?, referenceWeight: DatabaseDTO<UUID, DischargeWeightDTO>?, discharge: DatabaseDTO<UUID, DischargeDTO>?, sampleCollection: DatabaseDTO<UUID, SampleCollectionDTO>?, sampleReduction: DatabaseDTO<UUID, SampleReductionDTO>?, moistureDetermination: DatabaseDTO<UUID, MoistureDeterminationDTO>?, samplePreparation: DatabaseDTO<UUID, SamplePreparationDTO>?) {
        self.details = details
        self.billOfLading = billOfLading
        self.settlementWeight = settlementWeight
        self.referenceWeight = referenceWeight
        self.discharge = discharge
        self.sampleCollection = sampleCollection
        self.sampleReduction = sampleReduction
        self.moistureDetermination = moistureDetermination
        self.samplePreparation = samplePreparation
    }

    public init(id: UUID?, clientReference: String, shipmentDate: Date, norTime: Date, vesselName: String, clientID: Int, commodityID: Int, agentID: Int?, traderID: Int?, smelterID: Int, dischargePortID: Int, inspectionCompanyReceiverID: Int?, inspectionCompanySellerID: Int?, inspectionCompanySecondAgentID: Int?, conradTeamSize: Int, proceduralExceptions: [String], samplingProcedure: [String], comments: [String], createdAt: Date?, updatedAt: Date?, billOfLading: DatabaseDTO<UUID, BillOfLadingDTO>?, settlementWeight: DatabaseDTO<UUID, DischargeWeightDTO>?, referenceWeight: DatabaseDTO<UUID, DischargeWeightDTO>?, discharge: DatabaseDTO<UUID, DischargeDTO>?, sampleCollection: DatabaseDTO<UUID, SampleCollectionDTO>?, sampleReduction: DatabaseDTO<UUID, SampleReductionDTO>?, moistureDetermination: DatabaseDTO<UUID, MoistureDeterminationDTO>?, samplePreparation: DatabaseDTO<UUID, SamplePreparationDTO>?) {
        self.details = ShipmentDetailsDTO(id: id, clientReference: clientReference, shipmentDate: shipmentDate, norTime: norTime, vesselName: vesselName, clientID: clientID, commodityID: commodityID, agentID: agentID, traderID: traderID, smelterID: smelterID, dischargePortID: dischargePortID, inspectionCompanyReceiverID: inspectionCompanyReceiverID, inspectionCompanySellerID: inspectionCompanySellerID, inspectionCompanySecondAgentID: inspectionCompanySecondAgentID, conradTeamSize: conradTeamSize, proceduralExceptions: proceduralExceptions, samplingProcedure: samplingProcedure, comments: comments, createdAt: createdAt, updatedAt: updatedAt)
        self.billOfLading = billOfLading
        self.settlementWeight = settlementWeight
        self.referenceWeight = referenceWeight
        self.discharge = discharge
        self.sampleCollection = sampleCollection
        self.sampleReduction = sampleReduction
        self.moistureDetermination = moistureDetermination
        self.samplePreparation = samplePreparation
    }

    public enum CodingKeys: String, CodingKey {
        case details
        case billOfLading
        case settlementWeight
        case referenceWeight
        case discharge
        case sampleCollection
        case sampleReduction
        case moistureDetermination
        case samplePreparation
    }
}
