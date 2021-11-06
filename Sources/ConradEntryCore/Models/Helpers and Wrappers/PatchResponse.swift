//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public enum PatchResponse<Item: VersionedResource & Identifiable>: Identifiable, VersionedResource {
    case patched(id: Item.ID, version: Item.Version)
    case conflict(item: Item)

    public var version: Item.Version {
        switch self {
        case let .patched(_, version): return version
        case let .conflict(existing): return existing.version
        }
    }

    public var id: Item.ID {
        switch self {
        case let .patched(id, _): return id
        case let .conflict(existing): return existing.id
        }
    }
}

extension PatchResponse: Equatable where Item: Equatable, Item.Version: Equatable {}
extension PatchResponse: Hashable where Item: Hashable, Item.Version: Hashable {}
extension PatchResponse: Encodable where Item: Encodable, Item.ID: Encodable, Item.Version: Encodable {}
extension PatchResponse: Decodable where Item: Decodable, Item.ID: Decodable, Item.Version: Decodable {}

extension PatchResponse: APIResponse where Item: APIResponseItem {
    public static func id(id: Item.ID, version: Item.Version) -> PatchResponse<Item> { .patched(id: id, version: version) }
    public static func item(item: Item) -> PatchResponse<Item> { .conflict(item: item) }
}
