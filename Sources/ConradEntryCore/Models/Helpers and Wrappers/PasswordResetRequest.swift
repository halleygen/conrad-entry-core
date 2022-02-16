//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct PasswordChangeRequest {
    public let password: String
    private let confirmPassword: String

    public init?(password: String, confirmPassword: String) {
        guard password == confirmPassword else { return nil }
        self.password = password
        self.confirmPassword = confirmPassword
    }

    enum CodingKeys: String, CodingKey {
        case password, confirmPassword
    }
}

extension PasswordChangeRequest: Encodable {}

extension PasswordChangeRequest: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let password = try container.decode(String.self, forKey: .password)
        let confirmPassword = try container.decode(String.self, forKey: .confirmPassword)
        guard password == confirmPassword else {
            throw DecodingError.dataCorruptedError(forKey: .confirmPassword, in: container, debugDescription: "Passwords did not match.")
        }
        self.password = password
        self.confirmPassword = confirmPassword
    }
}
