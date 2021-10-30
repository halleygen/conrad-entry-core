//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public enum CreateResponse<Item: VersionedResource & Identifiable>: VersionedResource, Identifiable {
    case success(id: Item.ID, version: Item.Version)
    case alreadyExists(existing: Item)
    
    public var version: Item.Version {
        switch self {
        case .success(_, let version): return version
        case .alreadyExists(let existing): return existing.version
        }
    }
    
    public var id: Item.ID {
        switch self {
        case .success(let id, _): return id
        case .alreadyExists(let existing): return existing.id
        }
    }
}

extension CreateResponse: Encodable where Item: Encodable, ID: Encodable, Version: Encodable {}
extension CreateResponse: Decodable where Item: Decodable, ID: Decodable, Version: Decodable {}
extension CreateResponse: Equatable where Item: Equatable, ID: Equatable, Version: Equatable {}
extension CreateResponse: Hashable where Item: Hashable, ID: Hashable, Version: Hashable {}
