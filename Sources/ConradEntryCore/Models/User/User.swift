//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct User: Codable, Hashable, Identifiable {
    public let id: UUID
    public let givenName: String
    public let familyName: String
    public let email: String
    public var privileges: Set<Privilege>
    public var isLocked: Bool
    public let creationDate: Date
    public var devices: [Device]

    public init(id: UUID, givenName: String, familyName: String, email: String, privileges: Set<Privilege>, isLocked: Bool, creationDate: Date, devices: [Device]) {
        self.id = id
        self.givenName = givenName
        self.familyName = familyName
        self.email = email
        self.privileges = privileges
        self.isLocked = isLocked
        self.creationDate = creationDate
        self.devices = devices
    }

    public enum CodingKeys: String, CodingKey {
        case id, givenName, familyName, email, privileges, isLocked, creationDate, devices
    }

    public var nameComponents: PersonNameComponents {
        var components = PersonNameComponents()
        components.givenName = givenName
        components.familyName = familyName
        return components
    }

    public func authenticating(with token: SessionToken) -> AuthenticatedUser {
        AuthenticatedUser(user: self, token: token)
    }

    #if os(Linux)
        public func fullName(style: Any = false) -> String {
            "\(givenName) \(familyName)"
        }
    #else
        public func fullName(style: PersonNameComponentsFormatter.Style = .default) -> String {
            PersonNameComponentsFormatter.localizedString(from: nameComponents, style: style)
        }
    #endif
}
