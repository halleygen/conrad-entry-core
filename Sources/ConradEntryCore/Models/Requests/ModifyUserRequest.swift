//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct ModifyUserRequest: Codable, Hashable {
    public var userID: PublicUser.ID
    public var isLocked: Bool?
    public var privileges: Set<UserPrivilege>?

    private init(userID: PublicUser.ID, isLocked: Bool? = nil, privileges: Set<UserPrivilege>? = nil) {
        self.userID = userID
        self.isLocked = isLocked
        self.privileges = privileges
    }

    public init(userID: PublicUser.ID, isLocked: Bool, privileges: Set<UserPrivilege>) {
        self.init(userID: userID, isLocked: isLocked as Bool?, privileges: privileges as Set<UserPrivilege>?)
    }

    public static func setLocked(_ isLocked: Bool, for userID: PublicUser.ID) -> Self { Self(userID: userID, isLocked: isLocked) }
    public static func setPrivileges(_ privileges: Set<UserPrivilege>, for userID: PublicUser.ID) -> Self { Self(userID: userID, privileges: privileges) }
}
