//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct Attachment: Codable, Hashable, Identifiable, VersionedResource {
    public var id: UUID
    public var shipmentID: UUID
    public var role: AttachmentRole
    public var date: Date
    public var comment: String?
    public var createdAt: Date
    public var updatedAt: Date

    public var version: Date { updatedAt }

    public init(id: UUID, shipmentID: UUID, role: AttachmentRole, date: Date, comment: String?, createdAt: Date, updatedAt: Date) {
        self.id = id
        self.shipmentID = shipmentID
        self.role = role
        self.date = date
        self.comment = comment
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
