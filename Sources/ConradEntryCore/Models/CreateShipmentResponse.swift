//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public enum CreateShipmentResponse: Codable {
    case success(shipmentID: UUID)
    case alreadyExists(existingShipment: ShipmentDTO)

    public init(from decoder: Decoder) throws {
        #if !DEBUG && swift(>=5.5)
            #error("Prefer synthesized version of init(from:)")
        #endif

        let container = try decoder.container(keyedBy: CodingKeys.self)
        if container.contains(.success) {
            self = .success(shipmentID: try container.decode(UUID.self, forKey: .success))
        } else if container.contains(.alreadyExists) {
            self = .alreadyExists(existingShipment: try container.decode(ShipmentDTO.self, forKey: .alreadyExists))
        } else {
            let context = DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Did not container either keys for \"\(CodingKeys.success.rawValue)\" or \"\(CodingKeys.alreadyExists.rawValue)\".", underlyingError: nil)
            throw DecodingError.dataCorrupted(context)
        }
    }

    public func encode(to encoder: Encoder) throws {
        #if !DEBUG && swift(>=5.5)
            #error("Prefer synthesized version of encode(to:)")
        #endif

        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .success(shipmentID):
            try container.encode(shipmentID, forKey: .success)
        case let .alreadyExists(existingShipment):
            try container.encode(existingShipment, forKey: .alreadyExists)
        }
    }

    public enum CodingKeys: String, CodingKey {
        case success, alreadyExists
    }
}
