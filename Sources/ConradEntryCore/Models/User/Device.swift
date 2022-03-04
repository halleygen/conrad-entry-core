//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

@preconcurrency
import Foundation

public struct Device: Hashable, Identifiable, Codable {
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

    /// The token to use when sending this device push notifications.
    public let notificationToken: String?

    public let creationDate: Date?

    public init(id: UUID, name: String, model: String, systemName: String, systemVersion: String, notificationToken: String?, creationDate: Date?) {
        self.id = id
        self.name = name
        self.model = model
        self.systemName = systemName
        self.systemVersion = systemVersion
        self.notificationToken = notificationToken
        self.creationDate = creationDate
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case model
        case systemName
        case systemVersion
        case notificationToken
        case creationDate
    }

    public static func == (lhs: Device, rhs: Device) -> Bool {
        lhs.id == rhs.id && lhs.notificationToken == rhs.notificationToken
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(notificationToken)
    }
}
