//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct PushNotificationRegistrationRequest: Codable {
    public var token: String
    public var service: Service

    public init(token: String, service: Service) {
        self.token = token
        self.service = service
    }

    public enum Service: Codable {
        case apns
    }
}
