//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public enum IfModified<Value: VersionedResource & Identifiable>: Identifiable, VersionedResource {
    public typealias ID = Value.ID
    public typealias Version = Value.Version

    case notModified(id: Value.ID, version: Value.Version)
    case modified(value: Value)

    public init(value: Value) {
        self = .modified(value: value)
    }

    public init(id: ID, version: Version) {
        self = .notModified(id: id, version: version)
    }

    public var id: ID {
        switch self {
        case let .notModified(id, _): return id
        case let .modified(value): return value.id
        }
    }

    public var version: Version {
        switch self {
        case let .notModified(_, version): return version
        case let .modified(value): return value.version
        }
    }
}

extension IfModified: Equatable where Value.Version: Equatable, Value: Equatable {}
extension IfModified: Hashable where Value.Version: Hashable, Value: Hashable {}
extension IfModified: Encodable where Value.ID: Encodable, Value.Version: Encodable, Value: Encodable {}
extension IfModified: Decodable where Value.ID: Decodable, Value.Version: Decodable, Value: Decodable {}
