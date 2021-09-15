//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public enum PatchShipmentResponse<Item: Codable>: Codable {
    case success(lastModified: Date)
    case conflict(Item)

    public init(from decoder: Decoder) throws {
        #if !DEBUG && swift(>=5.5)
            #error("Prefer synthesized version of init(from:)")
        #endif
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if container.contains(.success) {
            self = .success(lastModified: try container.decode(Date.self, forKey: .success))
        } else if container.contains(.conflict) {
            self = .conflict(try container.decode(Item.self, forKey: .conflict))
        } else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Did not container either keys for \"\(CodingKeys.success.rawValue)\" or \"\(CodingKeys.conflict.rawValue)\".", underlyingError: nil))
        }
    }

    public func encode(to encoder: Encoder) throws {
        #if !DEBUG && swift(>=5.5)
            #error("Prefer synthesized version of encode(to:)")
        #endif

        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .success(lastModified):
            try container.encode(lastModified, forKey: .success)
        case let .conflict(item):
            try container.encode(item, forKey: .conflict)
        }
    }

    public enum CodingKeys: String, CodingKey {
        case success, conflict
    }
}

extension PatchShipmentResponse: Equatable where Item: Equatable {}
extension PatchShipmentResponse: Hashable where Item: Hashable {}
