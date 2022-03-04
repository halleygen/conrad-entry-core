//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct AttachmentUploadRequest: Codable {
    public let role: AttachmentRole
    public let date: Date
    public let ext: String
    public let md5: String
    public let comment: String

    public init(role: AttachmentRole, date: Date, ext: String, md5: String, comment: String) {
        self.role = role
        self.date = date
        self.ext = ext
        self.md5 = md5
        self.comment = comment
    }
}
