//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct ShipmentChangesRequest: Codable {
    public let part: ShipmentPart
    public let partID: UUID
    public let date: Date?

    public init(part: ShipmentPart, partID: UUID, date: Date?) {
        self.part = part
        self.partID = partID
        self.date = date
    }
}
