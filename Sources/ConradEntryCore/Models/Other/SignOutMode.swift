//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public enum SignOutMode: Hashable {
    case devices([UUID])
    case allDevices

    public func queryItems() -> [URLQueryItem] {
        switch self {
        case .allDevices:
            return [URLQueryItem(name: CodingKeys.allDevices.stringValue, value: String(true))]

        case let .devices(ids):
            return ids.map { URLQueryItem(name: "\(CodingKeys.devices.stringValue)[]", value: $0.uuidString) }
        }
    }
}

extension SignOutMode: Identifiable {
    public var id: Self { self }
}

extension SignOutMode: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if container.contains(.allDevices) {
            self = .allDevices
        } else if container.contains(.devices) {
            let ids = try container.decode([UUID].self, forKey: .devices)
            self = .devices(ids)
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Did not contain either a device or all-devices key.", underlyingError: nil))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .allDevices:
            try container.encode(true, forKey: .allDevices)

        case let .devices(ids):
            try container.encode(ids, forKey: .devices)
        }
    }

    public enum CodingKeys: String, CodingKey {
        case devices = "device"
        case allDevices = "all-devices"
    }
}
