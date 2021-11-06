//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public enum PutResponse<Item: VersionedResource & Identifiable>: Identifiable, VersionedResource {
    case success(id: Item.ID, version: Item.Version)
    case conflict(item: Item)

    public var version: Item.Version {
        switch self {
        case let .success(_, version): return version
        case let .conflict(existing): return existing.version
        }
    }

    public var id: Item.ID {
        switch self {
        case let .success(id, _): return id
        case let .conflict(existing): return existing.id
        }
    }
}

extension PutResponse: Equatable where Item: Equatable, Item.Version: Equatable {}
extension PutResponse: Hashable where Item: Hashable, Item.Version: Hashable {}
extension PutResponse: Encodable where Item: Encodable, Item.ID: Encodable, Item.Version: Encodable {}
extension PutResponse: Decodable where Item: Decodable, Item.ID: Decodable, Item.Version: Decodable {}

extension PutResponse: APIResponse where Item: APIResponseItem {
    public static func id(id: Item.ID, version: Item.Version) -> PutResponse<Item> { .success(id: id, version: version) }
    public static func item(item: Item) -> PutResponse<Item> { .conflict(item: item) }
}
