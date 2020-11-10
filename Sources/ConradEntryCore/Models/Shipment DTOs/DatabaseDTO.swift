//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

public enum DatabaseDTO<ID, Value>: Equatable, Hashable, Codable, Identifiable where ID: Codable, Value: Hashable & Codable & Identifiable, Value.ID == ID? {
    case id(ID)
    case value(Value)

    public var id: ID? {
        switch self {
        case let .id(id): return id
        case let .value(value): return value.id
        }
    }

    public var value: Value? {
        guard case let DatabaseDTO.value(value) = self else {
            return nil
        }
        return value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let id = try? container.decode(ID.self) {
            self = .id(id)
        } else if let value = try? container.decode(Value.self) {
            self = .value(value)
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Container did not contain either an ID or a value.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case let .id(id): try container.encode(id)
        case let .value(value): try container.encode(value)
        }
    }
}
