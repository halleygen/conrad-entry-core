//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct Signup: Codable, Hashable {
    public var givenName: String
    public var familyName: String
    public var email: String
    public var password: String
    public var confirmPassword: String

    public enum CodingKeys: String, CodingKey {
        case givenName, familyName, email, password, confirmPassword
    }

    public init(givenName: String, familyName: String, email: String, password: String, confirmPassword: String) {
        self.givenName = givenName
        self.familyName = familyName
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
    }
}
