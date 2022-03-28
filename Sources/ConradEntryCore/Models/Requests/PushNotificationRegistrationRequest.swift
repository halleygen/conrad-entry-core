//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct PushNotificationRegistrationRequest: Codable {
    public var token: String

    public init(token: String) {
        self.token = token
    }
}
