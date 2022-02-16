//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct PasswordChangeRequest: Codable {
    public let password: String
    public let confirmPassword: String

    public init(password: String, confirmPassword: String) {
        self.password = password
        self.confirmPassword = confirmPassword
    }
}
