//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public enum SignOutRequest: Hashable, Codable {
    case devices([Device.ID])
    case allDevices

    public func contains(_ device: Device) -> Bool {
        contains(id: device.id)
    }

    public func contains(id: Device.ID) -> Bool {
        switch self {
        case .allDevices: return true
        case let .devices(ids): return ids.contains(id)
        }
    }
}

extension SignOutRequest: Identifiable {
    public var id: Self { self }
}
