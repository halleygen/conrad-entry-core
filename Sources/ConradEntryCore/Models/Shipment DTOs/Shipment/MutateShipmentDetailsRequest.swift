//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct MutateShipmentDetailsRequest: ShipmentProtocol, Codable, Identifiable {
    public var id: UUID
    public var clientReference: String
    public var shipmentDate: Date
    public var norTime: Date
    public var vesselName: String
    public var clientID: Int
    public var commodityID: Int
    public var agentID: Int?
    public var traderID: Int?
    public var smelterID: Int
    public var dischargePortID: Int
    public var inspectionCompanyReceiverID: Int?
    public var inspectionCompanySellerID: Int?
    public var inspectionCompanySecondAgentID: Int?
    public var conradTeamSize: Int
    public var proceduralExceptions: [String]
    public var samplingProcedure: [String]
    public var comments: [String]

    public init(id: ID, clientReference: String, shipmentDate: Date, norTime: Date, vesselName: String, clientID: Int, commodityID: Int, agentID: Int?, traderID: Int?, smelterID: Int, dischargePortID: Int, inspectionCompanyReceiverID: Int?, inspectionCompanySellerID: Int?, inspectionCompanySecondAgentID: Int?, conradTeamSize: Int, proceduralExceptions: [String], samplingProcedure: [String], comments: [String]) {
        self.id = id
        self.clientReference = clientReference
        self.shipmentDate = shipmentDate
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
    }

    public init(_ other: ShipmentProtocol, id: ID) {
        self.init(id: id, clientReference: other.clientReference, shipmentDate: other.shipmentDate, norTime: other.norTime, vesselName: other.vesselName, clientID: other.clientID, commodityID: other.commodityID, agentID: other.agentID, traderID: other.traderID, smelterID: other.smelterID, dischargePortID: other.dischargePortID, inspectionCompanyReceiverID: other.inspectionCompanyReceiverID, inspectionCompanySellerID: other.inspectionCompanySellerID, inspectionCompanySecondAgentID: other.inspectionCompanySecondAgentID, conradTeamSize: other.conradTeamSize, proceduralExceptions: other.proceduralExceptions, samplingProcedure: other.samplingProcedure, comments: other.comments)
    }
}
