//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct PushNotificationRegistrationRequest: Codable {
    public var service: Service
    public var token: String

    public init(service: Service, token: String) {
        self.service = service
        self.token = token
    }

    public enum Service: Codable {
        case apns
    }
}

public extension PushNotificationRegistrationRequest {
    static func apns(token: String) -> Self {
        Self(service: .apns, token: token)
    }
}
