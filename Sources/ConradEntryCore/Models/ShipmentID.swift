//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

struct ShipmentID: Codable {
    var dateComponents: DateComponents?
    var client: String?
    var vesselName: String?
    var dischargePort: String?

    var date: Date? { dateComponents.flatMap(Calendar.iso8601.date) }
}
