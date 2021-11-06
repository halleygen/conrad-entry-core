//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public protocol APIResponseItem: Identifiable, VersionedResource, Codable where ID: Codable, Version: Codable {}

public protocol APIResponse: Identifiable, VersionedResource, Codable {
    associatedtype Item: APIResponseItem where Item.ID == ID, Item.Version == Version

    static func id(id: ID, version: Version) -> Self
    static func item(item: Item) -> Self
}

public extension APIResponse {
    init(id: ID, version: Version) {
        self = Self.id(id: id, version: version)
    }

    init(_ item: Item) {
        self = Self.item(item: item)
    }
}
