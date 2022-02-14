//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct CreateShipmentRequest: ShipmentProtocol, Codable {
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

    public var proceduralExceptions: [String] { [] }
    public var samplingProcedure: [String] { [] }
    public var comments: [String] { [] }

    public init(clientReference: String, logDate: Date, norTime: Date, vesselName: String, clientID: Int, commodityID: Int, agentID: Int?, traderID: Int?, smelterID: Int, dischargePortID: Int, inspectionCompanyReceiverID: Int?, inspectionCompanySellerID: Int?, inspectionCompanySecondAgentID: Int?, conradTeamSize: Int) {
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
    }

    public init(_ other: ShipmentProtocol) {
        self.init(clientReference: other.clientReference, logDate: other.logDate, norTime: other.norTime, vesselName: other.vesselName, clientID: other.clientID, commodityID: other.commodityID, agentID: other.agentID, traderID: other.traderID, smelterID: other.smelterID, dischargePortID: other.dischargePortID, inspectionCompanyReceiverID: other.inspectionCompanyReceiverID, inspectionCompanySellerID: other.inspectionCompanySellerID, inspectionCompanySecondAgentID: other.inspectionCompanySecondAgentID, conradTeamSize: other.conradTeamSize)
    }
}
