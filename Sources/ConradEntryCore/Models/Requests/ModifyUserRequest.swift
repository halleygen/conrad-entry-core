//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct ModifyUserRequest: Codable, Hashable {
    public var isLocked: Bool?
    public var privileges: Set<UserPrivilege>?

    private init(isLocked: Bool? = nil, privileges: Set<UserPrivilege>? = nil) {
        self.isLocked = isLocked
        self.privileges = privileges
    }

    public init(isLocked: Bool, privileges: Set<UserPrivilege>) {
        self.init(isLocked: isLocked as Bool?, privileges: privileges as Set<UserPrivilege>?)
    }

    public static func isLocked(_ isLocked: Bool) -> Self { Self(isLocked: isLocked) }
    public static func privileges(_ privileges: Set<UserPrivilege>) -> Self { Self(privileges: privileges) }
}
