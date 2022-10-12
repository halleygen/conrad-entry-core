//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public enum VersionedValueOrID<Item: Identifiable & Versioned>: Identifiable, Versioned {
    public typealias ID = Item.ID
    public typealias Version = Item.Version

    case id(id: ID, version: Version)
    case item(item: Item)

    public var id: ID {
        switch self {
        case let .id(id, _): return id
        case let .item(item): return item.id
        }
    }

    public var version: Version {
        switch self {
        case let .id(_, version): return version
        case let .item(item): return item.version
        }
    }

    public var item: Item? {
        switch self {
        case .id: return nil
        case let .item(item): return item
        }
    }
}

extension VersionedValueOrID: Equatable where Item: Equatable {}
extension VersionedValueOrID: Hashable where Item: Hashable {}
extension VersionedValueOrID: Encodable where Item: Encodable, Item.ID: Encodable, Item.Version: Encodable {}
extension VersionedValueOrID: Decodable where Item: Decodable, Item.ID: Decodable, Item.Version: Decodable {}
extension VersionedValueOrID: APIResponse where Item: APIResponseItem {}
