//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public enum CreateResponse<Item: VersionedResource & Identifiable>: VersionedResource, Identifiable {
    case created(id: Item.ID, version: Item.Version)
    case alreadyExists(item: Item)

    public var version: Item.Version {
        switch self {
        case let .created(_, version): return version
        case let .alreadyExists(item): return item.version
        }
    }

    public var id: Item.ID {
        switch self {
        case let .created(id, _): return id
        case let .alreadyExists(item): return item.id
        }
    }
}

extension CreateResponse: Equatable where Item: Equatable, ID: Equatable, Version: Equatable {}
extension CreateResponse: Hashable where Item: Hashable, ID: Hashable, Version: Hashable {}
extension CreateResponse: APIResponse where Item: APIResponseItem {}
