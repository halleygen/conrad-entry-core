//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

// MARK: - User

public protocol User: Hashable, Codable, Identifiable where ID == UUID {
    var id: ID { get }
    var givenName: String { get }
    var familyName: String { get }
    var email: String { get }
    var dateOfLastPasswordChange: Date? { get }
    var privileges: Set<UserPrivilege> { get set }
    var isLocked: Bool { get set }
    var creationDate: Date { get }
    var devices: [Device] { get set }
}

public extension User {
    #if os(Linux)

        func fullName() -> String { "\(givenName) \(familyName)" }

    #else

        var nameComponents: PersonNameComponents {
            var components = PersonNameComponents()
            components.givenName = givenName
            components.familyName = familyName
            return components
        }

        func fullName() -> String {
            if #available(iOS 15, macOS 12, *) {
                return nameComponents.formatted()
            } else {
                return PersonNameComponentsFormatter.localizedString(from: nameComponents, style: .default)
            }
        }

    #endif
}

// MARK: - PublicUser

public struct PublicUser: User {
    public let id: UUID
    public let givenName: String
    public let familyName: String
    public let email: String
    public let dateOfLastPasswordChange: Date?
    public var privileges: Set<UserPrivilege>
    public var isLocked: Bool
    public let creationDate: Date
    public var devices: [Device]

    public init(id: UUID, givenName: String, familyName: String, email: String, dateOfLastPasswordChange: Date?, privileges: Set<UserPrivilege>, isLocked: Bool, creationDate: Date, devices: [Device]) {
        self.id = id
        self.givenName = givenName
        self.familyName = familyName
        self.email = email
        self.dateOfLastPasswordChange = dateOfLastPasswordChange
        self.privileges = privileges
        self.isLocked = isLocked
        self.creationDate = creationDate
        self.devices = devices
    }

    public init<T: User>(_ other: T) {
        self.init(id: other.id, givenName: other.givenName, familyName: other.familyName, email: other.email, dateOfLastPasswordChange: other.dateOfLastPasswordChange, privileges: other.privileges, isLocked: other.isLocked, creationDate: other.creationDate, devices: other.devices)
    }

    public func authenticating(with token: SessionToken) -> AuthenticatedUser {
        precondition(id == token.userID)
        return AuthenticatedUser(id: id, givenName: givenName, familyName: familyName, email: email, dateOfLastPasswordChange: dateOfLastPasswordChange, sessionToken: token, privileges: privileges, isLocked: isLocked, creationDate: creationDate, devices: devices)
    }
}

// MARK: - AuthenticatedUser

public struct AuthenticatedUser: User {
    public let id: UUID
    public let givenName: String
    public let familyName: String
    public let email: String
    public let dateOfLastPasswordChange: Date?
    public var sessionToken: SessionToken
    public var privileges: Set<UserPrivilege>
    public var isLocked: Bool
    public let creationDate: Date
    public var devices: [Device]

    public init(id: UUID, givenName: String, familyName: String, email: String, dateOfLastPasswordChange: Date?, sessionToken: SessionToken, privileges: Set<UserPrivilege>, isLocked: Bool, creationDate: Date, devices: [Device]) {
        self.id = id
        self.givenName = givenName
        self.familyName = familyName
        self.email = email
        self.dateOfLastPasswordChange = dateOfLastPasswordChange
        self.sessionToken = sessionToken
        self.privileges = privileges
        self.isLocked = isLocked
        self.creationDate = creationDate
        self.devices = devices
    }
}
