//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct ShipmentDetails: Codable {
    public var date: Date?
    public var clientID: UUID?
    public var vesselName: String?
    public var dischargePortID: UUID?

    public init(date: Date? = nil, clientID: UUID? = nil, vesselName: String? = nil, dischargePortID: UUID? = nil) {
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
