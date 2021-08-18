//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

@dynamicMemberLookup
public struct AuthenticatedUser: Codable, Hashable, Identifiable {
    private let user: User
    public let token: SessionToken

    public var id: User.ID { user.id }

    init(user: User, token: SessionToken) {
        precondition(user.id == token.userID, "User.id and SessionToken.userID must be the same.")
        self.user = user
        self.token = token
    }

    public init(id: UUID, givenName: String, familyName: String, email: String, privileges: Set<User.Privilege>, isLocked: Bool, creationDate: Date, devices: [Device], token: SessionToken) {
        let user = User(id: id, givenName: givenName, familyName: familyName, email: email, privileges: privileges, isLocked: isLocked, creationDate: creationDate, devices: devices)
        self.init(user: user, token: token)
    }

    public subscript<T>(dynamicMember keyPath: KeyPath<User, T>) -> T { user[keyPath: keyPath] }

    public func asUser() -> User { user }
}
