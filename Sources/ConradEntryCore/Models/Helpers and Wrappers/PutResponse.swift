//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public enum PutResponse<Item: VersionedResource & Identifiable>: Identifiable, VersionedResource {
    case created(id: Item.ID, version: Item.Version)
    case updated(id: Item.ID, version: Item.Version)
    case conflict(item: Item)

    public var version: Item.Version {
        switch self {
        case let .created(_, version): return version
        case let .updated(_, version): return version
        case let .conflict(item): return item.version
        }
    }

    public var id: Item.ID {
        switch self {
        case let .created(id, _): return id
        case let .updated(id, _): return id
        case let .conflict(item): return item.id
        }
    }
}

extension PutResponse: Equatable where Item: Equatable, Item.Version: Equatable {}
extension PutResponse: Hashable where Item: Hashable, Item.Version: Hashable {}
extension PutResponse: APIResponse where Item: APIResponseItem {}
