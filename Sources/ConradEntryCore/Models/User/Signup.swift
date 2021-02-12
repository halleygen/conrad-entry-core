//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct Signup: Codable, Hashable {
    public var givenName: String
    public var familyName: String
    public var email: String
    public var password: String
    public var confirmPassword: String
    public var device: Device

    public enum CodingKeys: String, CodingKey {
        case givenName, familyName, email, password, confirmPassword, device
    }

    public init(givenName: String, familyName: String, email: String, password: String, confirmPassword: String, device: Device) {
        self.givenName = givenName
        self.familyName = familyName
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.device = device
    }

    public init(device: Device) {
        self.init(givenName: "", familyName: "", email: "", password: "", confirmPassword: "", device: device)
    }

    public var isValid: Bool {
        !givenName.isEmpty && !familyName.isEmpty && !email.isEmpty && password.count >= 8 && password == confirmPassword
    }

    public var passwordsDoNotMatch: Bool {
        (!password.isEmpty && !confirmPassword.isEmpty) && password != confirmPassword
    }
}
