//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public enum VersionedValueOrID<Value: Identifiable & VersionedResource>: Identifiable, VersionedResource {
    public typealias ID = Value.ID
    public typealias Version = Value.Version

    case id(id: ID, version: Version)
    case value(value: Value)

    public init(_ value: Value) {
        self = .value(value: value)
    }

    public init(_ id: ID, version: Version) {
        self = .id(id: id, version: version)
    }

    public var id: ID {
        switch self {
        case let .id(id, _): return id
        case let .value(value): return value.id
        }
    }

    public var version: Version {
        switch self {
        case let .id(_, version): return version
        case let .value(value): return value.version
        }
    }

    public var value: Value? {
        switch self {
        case .id: return nil
        case let .value(value): return value
        }
    }
}

extension VersionedValueOrID: Equatable where Value: Equatable {}
extension VersionedValueOrID: Hashable where Value: Hashable {}
extension VersionedValueOrID: Encodable where Value: Encodable, Value.ID: Encodable, Value.Version: Encodable {}
extension VersionedValueOrID: Decodable where Value: Decodable, Value.ID: Decodable, Value.Version: Decodable {}
