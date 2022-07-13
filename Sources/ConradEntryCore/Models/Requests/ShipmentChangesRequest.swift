//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct ShipmentChangesRequest: Codable {
    public let partID: UUID
    public let date: Date?

    public init(partID: UUID, date: Date?) {
        self.partID = partID
        self.date = date
    }
}
