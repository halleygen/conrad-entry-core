//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public enum CreateResponse<Item: VersionedResource & Identifiable>: VersionedResource, Identifiable {
    case created(id: Item.ID, version: Item.Version)
    case alreadyExists(existing: Item)

    public var version: Item.Version {
        switch self {
        case let .created(_, version): return version
        case let .alreadyExists(existing): return existing.version
        }
    }

    public var id: Item.ID {
        switch self {
        case let .created(id, _): return id
        case let .alreadyExists(existing): return existing.id
        }
    }
}

extension CreateResponse: Encodable where Item: Encodable, ID: Encodable, Version: Encodable {}
extension CreateResponse: Decodable where Item: Decodable, ID: Decodable, Version: Decodable {}
extension CreateResponse: Equatable where Item: Equatable, ID: Equatable, Version: Equatable {}
extension CreateResponse: Hashable where Item: Hashable, ID: Hashable, Version: Hashable {}

extension CreateResponse: APIResponse where Item: APIResponseItem {
    public static func id(id: Item.ID, version: Item.Version) -> CreateResponse<Item> { .created(id: id, version: version) }
    public static func item(item: Item) -> CreateResponse<Item> { .alreadyExists(existing: item) }
}
