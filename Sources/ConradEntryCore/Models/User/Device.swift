//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct Device: Hashable, Identifiable, Codable {
    /// The ID uniquely identifying the device.
    ///
    /// Corresponds to `UIDevice.identifierForVendor`
    public let id: UUID

    /// The ID of this device's user.
    public let userID: UUID

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

    public init(id: UUID, userID: UUID, model: String, systemName: String, systemVersion: String, notificationToken: String?, creationDate: Date?) {
        self.id = id
        self.userID = userID
        self.model = model
        self.systemName = systemName
        self.systemVersion = systemVersion
        self.notificationToken = notificationToken
        self.creationDate = creationDate
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case userID
        case model
        case systemName
        case systemVersion
        case notificationToken
        case creationDate
    }
}
