//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct ShipmentDetails: Codable {
    public var date: Date?
    public var clientID: Int?
    public var vesselName: String?
    public var dischargePortID: Int?

    public init(date: Date? = nil, clientID: Int? = nil, vesselName: String? = nil, dischargePortID: Int? = nil) {
        self.date = date
        self.clientID = clientID
        self.vesselName = vesselName
        self.dischargePortID = dischargePortID
    }

    public var month: Int? { date.map { Calendar.iso8601.component(.month, from: $0) } }
    public var year: Int? { date.map { Calendar.iso8601.component(.year, from: $0) } }

    public var isValid: Bool {
        date != nil || clientID != nil || vesselName != nil || dischargePortID != nil
    }
}
