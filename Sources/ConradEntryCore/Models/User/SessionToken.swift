//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct SessionToken: Codable, Hashable {
    public let userID: UUID
    public let value: String
    public let expiryDate: Date

    public init(userID: UUID, value: String, expiryDate: Date) {
        self.userID = userID
        self.value = value
        self.expiryDate = expiryDate
    }
}
