//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct CommentsGroup: Codable {
    public struct Comment: Identifiable, Hashable, Codable {
        public var id: UUID
        public var value: String
        public var version: Date?

        public init(id: UUID, value: String, version: Date? = nil) {
            self.id = id
            self.value = value
            self.version = version
        }
    }

    public var comments: [Comment]
    public var deletedIDs: Set<Comment.ID>

    public init(comments: [Comment], deletedIDs: Set<Comment.ID> = Set()) {
        self.comments = comments
        self.deletedIDs = deletedIDs
    }
}
