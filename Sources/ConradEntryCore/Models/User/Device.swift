//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct Device: Hashable, Identifiable, Codable, Sendable {
    /// The ID uniquely identifying the device.
    ///
    /// Corresponds to `UIDevice.identifierForVendor`
    public let id: UUID

    /// The name of the device.
    ///
    /// e.g. `Steve's iPhone`
    public let name: String

    /// The model of the device.
    ///
    /// e.g. `iPhone`
    public let model: String

    /// The name of the device's OS.
    ///
    /// e.g. `iOS`
    public let systemName: String

    /// The version of the device's OS.
    ///
    /// e.g. `14.4`
    public let systemVersion: String

    public let createdAt: Date?

    public init(id: UUID, name: String, model: String, systemName: String, systemVersion: String, createdAt: Date?) {
        self.id = id
        self.name = name
        self.model = model
        self.systemName = systemName
        self.systemVersion = systemVersion
        self.createdAt = createdAt
    }
}
