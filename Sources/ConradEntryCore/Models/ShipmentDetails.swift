//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct ShipmentDetails: Codable {
    public var date: Date?
    public var client: String?
    public var vesselName: String?
    public var dischargePort: Port?

    public init(date: Date? = nil, client: String? = nil, vesselName: String? = nil, dischargePort: Port? = nil) {
        self.date = date
        self.client = client
        self.vesselName = vesselName
        self.dischargePort = dischargePort
    }

    public var month: Int? { date.map { Calendar.iso8601.component(.month, from: $0) } }
    public var year: Int? { date.map { Calendar.iso8601.component(.year, from: $0) } }

    public var isValid: Bool {
        date != nil || client != nil || vesselName != nil || dischargePort != nil
    }
}
