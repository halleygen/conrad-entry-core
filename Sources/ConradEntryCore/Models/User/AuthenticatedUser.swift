//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

@dynamicMemberLookup
public struct AuthenticatedUser: Hashable, Identifiable {
    private let user: User
    public let token: SessionToken

    public var id: User.ID { user.id }

    init(user: User, token: SessionToken) {
        precondition(user.id == token.userID, "User.id and SessionToken.userID must be the same.")
        self.user = user
        self.token = token
    }

    public subscript<T>(dynamicMember keyPath: KeyPath<User, T>) -> T { user[keyPath: keyPath] }

    public func asUser() -> User {
        User(id: user.id, givenName: user.givenName, familyName: user.familyName, email: user.email, privileges: user.privileges, isLocked: user.isLocked, creationDate: user.creationDate, token: token, devices: user.devices)
    }
}
