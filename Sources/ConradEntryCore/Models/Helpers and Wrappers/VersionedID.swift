//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public struct VersionedID<ID: Hashable, Version: ETagConvertible>: Identifiable, VersionedResource {
    public let id: ID
    public let version: Version

    public init(id: ID, version: Version) {
        self.id = id
        self.version = version
    }

    public init<T: VersionedResource & Identifiable>(_ item: T) where T.ID == ID, T.Version == Version {
        self.init(id: item.id, version: item.version)
    }
}

extension VersionedID: Encodable where ID: Encodable, Version: Encodable {}
extension VersionedID: Decodable where ID: Decodable, Version: Decodable {}