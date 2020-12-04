//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct User: Codable, Hashable, Identifiable {
    public let id: UUID
    public let givenName: String
    public let familyName: String
    public let email: String
    public let priviledges: Priviledges
    public let isLocked: Bool
    public let creationDate: Date

    public init(id: UUID, givenName: String, familyName: String, email: String, priviledges: User.Priviledges, isLocked: Bool, creationDate: Date) {
        self.id = id
        self.givenName = givenName
        self.familyName = familyName
        self.email = email
        self.priviledges = priviledges
        self.isLocked = isLocked
        self.creationDate = creationDate
    }

    public enum CodingKeys: String, CodingKey {
        case id, givenName, familyName, email, priviledges, isLocked, creationDate
    }

    public var nameComponents: PersonNameComponents {
        var components = PersonNameComponents()
        components.givenName = givenName
        components.familyName = familyName
        return components
    }
    
    public func withLockState(_ locked: Bool) -> User {
        User(id: id, givenName: givenName, familyName: familyName, email: email, priviledges: priviledges, isLocked: locked, creationDate: creationDate)
    }
    
    public func withPriviledges(_ priviledges: Priviledges) -> User {
        User(id: id, givenName: givenName, familyName: familyName, email: email, priviledges: priviledges, isLocked: isLocked, creationDate: creationDate)
    }
}
