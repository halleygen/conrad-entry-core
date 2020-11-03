//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct User: Codable, Hashable {
    public let id: UUID
    public let firstName: String
    public let lastName: String
    public let email: String
    public let priviledges: Priviledges
    public let creationDate: Date

    public init(id: UUID, firstName: String, lastName: String, email: String, priviledges: User.Priviledges, creationDate: Date) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.priviledges = priviledges
        self.creationDate = creationDate
    }

    public enum CodingKeys: String, CodingKey {
        case id, firstName, lastName, email, priviledges, creationDate
    }
}
