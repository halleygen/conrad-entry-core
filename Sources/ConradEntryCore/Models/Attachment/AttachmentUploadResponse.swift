//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct AttachmentUploadResponse: Decodable {
    public let id: UUID
    public let temporaryUploadURL: URL

    public init(id: UUID, temporaryUploadURL: URL) {
        self.id = id
        self.temporaryUploadURL = temporaryUploadURL
    }
}
