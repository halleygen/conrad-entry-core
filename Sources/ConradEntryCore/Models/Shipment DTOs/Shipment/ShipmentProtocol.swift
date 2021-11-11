//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public protocol ShipmentProtocol {
    var clientReference: String { get }
    var logDate: Date { get }
    var norTime: Date { get }
    var vesselName: String { get }
    var clientID: Int { get }
    var commodityID: Int { get }
    var agentID: Int? { get }
    var traderID: Int? { get }
    var smelterID: Int { get }
    var dischargePortID: Int { get }
    var inspectionCompanyReceiverID: Int? { get }
    var inspectionCompanySellerID: Int? { get }
    var inspectionCompanySecondAgentID: Int? { get }
    var conradTeamSize: Int { get }
    var proceduralExceptions: [String] { get }
    var samplingProcedure: [String] { get }
    var comments: [String] { get }
}
