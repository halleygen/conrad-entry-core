//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

private let jsonDecoder = JSONDecoder()
private let jsonEncoder = JSONEncoder()

public typealias DictionaryCodable = DictionaryEncodable & DictionaryDecodable

public protocol DictionaryEncodable: Encodable {
    func dictionaryRepresentation() throws -> [String: Any]
}

public extension DictionaryEncodable {
    func dictionaryRepresentation() throws -> [String: Any] {
        let data = try jsonEncoder.encode(self)
        guard let object = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            throw DecodingError.typeMismatch([String: Any].self, .init(codingPath: [], debugDescription: "Dictionary could not be created from JSON."))
        }
        return object
    }
}

public protocol DictionaryDecodable: Decodable {
    init(from dictionary: [String: Any]) throws
}

public extension DictionaryDecodable {
    init(from dictionary: [String: Any]) throws {
        let data = try JSONSerialization.data(withJSONObject: dictionary)
        self = try jsonDecoder.decode(Self.self, from: data)
    }
}
