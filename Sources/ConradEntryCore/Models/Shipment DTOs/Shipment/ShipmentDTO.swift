//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct ShipmentDTO: ShipmentProtocol, APIResponseItem {
    public let id: UUID
    public let clientReference: String
    public let logDate: Date
    public let norTime: Date
    public let vesselName: String
    public let clientID: Int
    public let commodityID: Int
    public let agentID: Int?
    public let traderID: Int?
    public let smelterID: Int
    public let dischargePortID: Int
    public let inspectionCompanyReceiverID: Int?
    public let inspectionCompanySellerID: Int?
    public let inspectionCompanySecondAgentID: Int?
    public let conradTeamSize: Int
    public let proceduralExceptions: [String]
    public let samplingProcedure: [String]
    public let comments: [String]
    public let createdAt: Date
    public let updatedAt: Date

    public var version: Date { updatedAt }

    public let billOfLading: ValueOrID<BillOfLadingDTO>?
    public let settlementWeight: ValueOrID<DischargeWeightDTO>?
    public let referenceWeight: ValueOrID<DischargeWeightDTO>?
    public let discharge: ValueOrID<DischargeDTO>?
    public let sampleCollection: ValueOrID<SampleCollectionDTO>?
    public let sampleReduction: ValueOrID<SampleReductionDTO>?
    public let moistureDetermination: ValueOrID<MoistureDeterminationDTO>?
    public let samplePreparation: ValueOrID<SamplePreparationDTO>?

    public init(id: UUID, clientReference: String, logDate: Date, norTime: Date, vesselName: String, clientID: Int, commodityID: Int, agentID: Int?, traderID: Int?, smelterID: Int, dischargePortID: Int, inspectionCompanyReceiverID: Int?, inspectionCompanySellerID: Int?, inspectionCompanySecondAgentID: Int?, conradTeamSize: Int, proceduralExceptions: [String], samplingProcedure: [String], comments: [String], createdAt: Date, updatedAt: Date, billOfLading: ValueOrID<BillOfLadingDTO>?, settlementWeight: ValueOrID<DischargeWeightDTO>?, referenceWeight: ValueOrID<DischargeWeightDTO>?, discharge: ValueOrID<DischargeDTO>?, sampleCollection: ValueOrID<SampleCollectionDTO>?, sampleReduction: ValueOrID<SampleReductionDTO>?, moistureDetermination: ValueOrID<MoistureDeterminationDTO>?, samplePreparation: ValueOrID<SamplePreparationDTO>?) {
        self.id = id
        self.clientReference = clientReference
        self.logDate = logDate
        self.norTime = norTime
        self.vesselName = vesselName
        self.clientID = clientID
        self.commodityID = commodityID
        self.agentID = agentID
        self.traderID = traderID
        self.smelterID = smelterID
        self.dischargePortID = dischargePortID
        self.inspectionCompanyReceiverID = inspectionCompanyReceiverID
        self.inspectionCompanySellerID = inspectionCompanySellerID
        self.inspectionCompanySecondAgentID = inspectionCompanySecondAgentID
        self.conradTeamSize = conradTeamSize
        self.proceduralExceptions = proceduralExceptions
        self.samplingProcedure = samplingProcedure
        self.comments = comments
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.billOfLading = billOfLading
        self.settlementWeight = settlementWeight
        self.referenceWeight = referenceWeight
        self.discharge = discharge
        self.sampleCollection = sampleCollection
        self.sampleReduction = sampleReduction
        self.moistureDetermination = moistureDetermination
        self.samplePreparation = samplePreparation
    }

    public init(_ other: ShipmentProtocol, id: UUID, createdAt: Date, updatedAt: Date, billOfLading: ValueOrID<BillOfLadingDTO>?, settlementWeight: ValueOrID<DischargeWeightDTO>?, referenceWeight: ValueOrID<DischargeWeightDTO>?, discharge: ValueOrID<DischargeDTO>?, sampleCollection: ValueOrID<SampleCollectionDTO>?, sampleReduction: ValueOrID<SampleReductionDTO>?, moistureDetermination: ValueOrID<MoistureDeterminationDTO>?, samplePreparation: ValueOrID<SamplePreparationDTO>?) {
        self.init(id: id, clientReference: other.clientReference, logDate: other.logDate, norTime: other.norTime, vesselName: other.vesselName, clientID: other.clientID, commodityID: other.commodityID, agentID: other.agentID, traderID: other.traderID, smelterID: other.smelterID, dischargePortID: other.dischargePortID, inspectionCompanyReceiverID: other.inspectionCompanyReceiverID, inspectionCompanySellerID: other.inspectionCompanySellerID, inspectionCompanySecondAgentID: other.inspectionCompanySecondAgentID, conradTeamSize: other.conradTeamSize, proceduralExceptions: other.proceduralExceptions, samplingProcedure: other.samplingProcedure, comments: other.comments, createdAt: createdAt, updatedAt: updatedAt, billOfLading: billOfLading, settlementWeight: settlementWeight, referenceWeight: referenceWeight, discharge: discharge, sampleCollection: sampleCollection, sampleReduction: sampleReduction, moistureDetermination: moistureDetermination, samplePreparation: samplePreparation)
    }
}
