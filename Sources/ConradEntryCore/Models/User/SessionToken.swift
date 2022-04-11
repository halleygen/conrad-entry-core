//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct SessionToken: Codable, Hashable {
    public let userID: UUID
    public let value: String
    public let expiryDate: Date

    public init(userID: UUID, value: String, expiryDate: Date) {
        self.userID = userID
        self.value = value
        self.expiryDate = expiryDate
    }

    public var isValid: Bool { Date() < expiryDate }
}

#if !os(Linux)

    public extension SessionToken {
        var ref: Reference { Reference(self) }

        init(_ ref: Reference) {
            self.init(userID: ref.userID as UUID, value: ref.value as String, expiryDate: ref.expiryDate as Date)
        }

        @objc(SessionTokenReference)
        final class Reference: NSObject, NSSecureCoding, NSCopying {
            @objc public static var supportsSecureCoding: Bool { true }

            @objc public let userID: NSUUID
            @objc public let value: NSString
            @objc public let expiryDate: NSDate

            public convenience init(_ token: SessionToken) {
                self.init(userID: token.userID as NSUUID, value: token.value as NSString, expiryDate: token.expiryDate as NSDate)
            }

            public init(userID: NSUUID, value: NSString, expiryDate: NSDate) {
                self.userID = userID
                self.value = value
                self.expiryDate = expiryDate
            }

            public convenience init?(coder: NSCoder) {
                guard
                    let userID = coder.decodeObject(of: NSUUID.self, forKey: #keyPath(userID)),
                    let value = coder.decodeObject(of: NSString.self, forKey: #keyPath(value)),
                    let expiryDate = coder.decodeObject(of: NSDate.self, forKey: #keyPath(expiryDate))
                else { return nil }
                self.init(userID: userID, value: value, expiryDate: expiryDate)
            }

            public func encode(with coder: NSCoder) {
                coder.encode(userID, forKey: #keyPath(userID))
                coder.encode(value, forKey: #keyPath(value))
                coder.encode(expiryDate, forKey: #keyPath(expiryDate))
            }

            override public func isEqual(to object: Any?) -> Bool {
                switch object {
                case let swiftType as SessionToken:
                    return (userID as UUID == swiftType.userID) && (value as String == swiftType.value) && (expiryDate as Date == swiftType.expiryDate)

                case let refType as Reference:
                    return userID == refType.userID && value == refType.value && expiryDate == refType.expiryDate

                default:
                    return false
                }
            }

            override public var hash: Int {
                var hasher = Hasher()
                hasher.combine(userID)
                hasher.combine(value)
                hasher.combine(expiryDate)
                return hasher.finalize()
            }

            public func copy(with zone: NSZone? = nil) -> Any {
                Self(userID: userID, value: value, expiryDate: expiryDate)
            }
        }
    }

#endif
