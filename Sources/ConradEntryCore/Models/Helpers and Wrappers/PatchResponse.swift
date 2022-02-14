//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
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
extension PatchResponse: APIResponse where Item: APIResponseItem {}
