//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct ShipmentID: Codable {
    public var dateComponents: DateComponents?
    public var client: String?
    public var vesselName: String?
    public var dischargePort: String?
    
    public init(dateComponents: DateComponents? = nil, client: String? = nil, vesselName: String? = nil, dischargePort: String? = nil) {
        precondition(dateComponents != nil || client != nil || vesselName != nil || dischargePort != nil, "[ShipmentID]: At least one property must not be nil.")
        self.dateComponents = dateComponents
        self.client = client
        self.vesselName = vesselName
        self.dischargePort = dischargePort
    }

    public var date: Date? { dateComponents.flatMap(Calendar.iso8601.date) }
    
    public var isValid: Bool {
        dateComponents != nil || client != nil || vesselName != nil || dischargePort != nil
    }
}
