//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct User: Codable, Hashable, Identifiable {
    public let id: UUID
    public let givenName: String
    public let familyName: String
    public let email: String
    public var privileges: Set<Privilege>
    public var isLocked: Bool
    public let creationDate: Date

    public init(id: UUID, givenName: String, familyName: String, email: String, privileges: Set<Privilege>, isLocked: Bool, creationDate: Date) {
        self.id = id
        self.givenName = givenName
        self.familyName = familyName
        self.email = email
        self.privileges = privileges
        self.isLocked = isLocked
        self.creationDate = creationDate
    }

    public enum CodingKeys: String, CodingKey {
        case id, givenName, familyName, email, privileges, isLocked, creationDate
    }

    public var nameComponents: PersonNameComponents {
        var components = PersonNameComponents()
        components.givenName = givenName
        components.familyName = familyName
        return components
    }
}
