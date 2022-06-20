//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation
import OrderedCollections

// MARK: - Comments

public struct CommentsDTO: ExpressibleByDictionaryLiteral {
    public typealias Key = UUID
    public typealias Value = String

    var _base: OrderedDictionary<UUID, String>

    public init() {
        self._base = OrderedDictionary()
    }

    public init(dictionaryLiteral elements: (Key, Value)...) {
        self._base = OrderedDictionary(uniqueKeysWithValues: elements)
    }
}

// MARK: - Functions

public extension CommentsDTO {
    var count: Int { _base.count }
    var isEmpty: Bool { _base.isEmpty }

    subscript(id: Key) -> Value? {
        get { _base[id] }
        set { _base[id] = newValue }
        _modify { yield &_base[id] }
    }

    mutating func reserveCapacity(_ minimumCapacity: Int) {
        _base.reserveCapacity(minimumCapacity)
    }
}

// MARK: - Sequence

extension CommentsDTO: Sequence {
    public typealias Element = OrderedDictionary<UUID, String>.Element
    public typealias Iterator = OrderedDictionary<UUID, String>.Iterator

    public var underestimatedCount: Int { _base.underestimatedCount }

    public func makeIterator() -> Iterator {
        _base.makeIterator()
    }
}

// MARK: - Codable

extension CommentsDTO: Codable {
    private struct CodableElement: Codable {
        let id: UUID
        let value: String
    }

    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()

        var idsWithComments = OrderedDictionary<UUID, String>()
        if let count = container.count {
            idsWithComments.reserveCapacity(count)
        }

        while !container.isAtEnd {
            let element = try container.decode(CodableElement.self)
            idsWithComments[element.id] = element.value
        }

        self._base = idsWithComments
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()

        for (id, value) in _base {
            try container.encode(CodableElement(id: id, value: value))
        }
    }
}
