//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public enum SignOutMode: Codable, Hashable {
    case singleDevice(UUID)
    case allDevices

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let singleDeviceID = try container.decodeIfPresent(UUID.self, forKey: .singleDevice) {
            self = .singleDevice(singleDeviceID)
        } else if container.contains(.allDevices) {
            self = .allDevices
        } else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: ""))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .allDevices:
            try container.encode(true, forKey: .allDevices)

        case let .singleDevice(deviceID):
            try container.encode(deviceID, forKey: .singleDevice)
        }
    }

    public enum CodingKeys: String, CodingKey {
        case singleDevice = "device", allDevices
    }
}
