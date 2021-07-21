//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public enum DatabaseDTO<ID, Value>: Equatable, Hashable, Codable, Identifiable, VersionedDTO where ID: Codable, Value: Hashable & Codable & Identifiable & VersionedDTO, Value.ID == ID? {
    case id(ID, Date)
    case value(Value)

    public var id: ID? {
        switch self {
        case let .id(id, _): return id
        case let .value(value): return value.id
        }
    }

    public var value: Value? {
        guard case let DatabaseDTO.value(value) = self else {
            return nil
        }
        return value
    }

    public var updatedAt: Date? {
        switch self {
        case let .id(_, updatedAt): return updatedAt
        case let .value(value): return value.updatedAt
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if container.contains(.value) {
            self = .value(
                try container.decode(Value.self, forKey: .value)
            )
        } else {
            self = .id(
                try container.decode(ID.self, forKey: .id),
                try container.decode(Date.self, forKey: .updatedAt)
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case let .id(id, updatedAt):
            try container.encode(id, forKey: .id)
            try container.encode(updatedAt, forKey: .updatedAt)
        case let .value(value):
            try container.encode(value, forKey: .value)
        }
    }
}

public extension DatabaseDTO {
    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt
        case value
    }
}

public extension DatabaseDTO {
    init(value: Value) {
        self = .value(value)
    }

    init(id: ID, updatedAt: Date) {
        self = .id(id, updatedAt)
    }
}
