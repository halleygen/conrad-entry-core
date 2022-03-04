//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct CreateResponse<Item: VersionedResource & Identifiable>: VersionedResource, Identifiable {
    public let id: Item.ID
    public let version: Item.Version
    public let wasCreated: Bool

    public init(id: Item.ID, version: Item.Version, wasCreated: Bool) {
        self.id = id
        self.version = version
        self.wasCreated = wasCreated
    }

    public static func alreadyExists(id: Item.ID, version: Item.Version) -> Self {
        Self(id: id, version: version, wasCreated: false)
    }

    public static func created(id: Item.ID, version: Item.Version) -> Self {
        Self(id: id, version: version, wasCreated: true)
    }
}

extension CreateResponse: Equatable where ID: Equatable, Version: Equatable {}
extension CreateResponse: Hashable where ID: Hashable, Version: Hashable {}
extension CreateResponse: APIResponse where Item: APIResponseItem {}
