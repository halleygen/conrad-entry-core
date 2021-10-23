//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public typealias CreateResponseFor<Item: Identifiable> = CreateResponse<Item.ID, Item>

public enum CreateResponse<ID, Item> {
    case success(id: ID, updatedAt: Date)
    case alreadyExists(existing: Item)
}

extension CreateResponse: Encodable where Item: Encodable, ID: Encodable {}
extension CreateResponse: Decodable where Item: Decodable, ID: Decodable {}
extension CreateResponse: Equatable where Item: Equatable, ID: Equatable {}
extension CreateResponse: Hashable where Item: Hashable, ID: Hashable {}
extension CreateResponse: Identifiable where Item: Identifiable, Item.ID == ID {
    public var id: ID {
        switch self {
        case let .success(id, _): return id
        case let .alreadyExists(existing): return existing.id
        }
    }
}
