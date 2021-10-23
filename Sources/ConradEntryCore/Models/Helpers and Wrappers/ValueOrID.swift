//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public enum ValueOrID<Value: Identifiable>: Identifiable {
    case id(Value.ID)
    case value(Value)

    public var id: Value.ID {
        switch self {
        case let .id(id): return id
        case let .value(value): return value.id
        }
    }
}

extension ValueOrID: Equatable where Value: Equatable {}
extension ValueOrID: Hashable where Value: Hashable {}
extension ValueOrID: Encodable where Value.ID: Encodable, Value: Encodable {}
extension ValueOrID: Decodable where Value.ID: Decodable, Value: Decodable {}