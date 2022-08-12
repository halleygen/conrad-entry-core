//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct Tallymen: Hashable, Codable, Sendable {
    /// The number of tallymen.
    public var count: Int

    /// The location of the tallymen.
    public var location: String

    public init(count: Int, location: String) {
        self.count = count
        self.location = location
    }
}

#if os(macOS) || os(iOS)

    import Foundation

    extension Tallymen: ReferenceConvertible {
        public typealias ReferenceType = Reference
        public typealias _ObjectiveCType = Reference

        public var debugDescription: String {
            description
        }

        public var description: String {
            "Tallymen(count: \(count), location: \(location))"
        }

        @_semantics("convertToObjectiveC")
        public func _bridgeToObjectiveC() -> ReferenceType {
            ReferenceType(count: count, location: location)
        }

        public static func _forceBridgeFromObjectiveC(_ source: ReferenceType, result: inout Self?) {
            result = Self(count: source.count, location: source.location)
        }

        public static func _conditionallyBridgeFromObjectiveC(_ source: ReferenceType, result: inout Self?) -> Bool {
            result = Self(count: source.count, location: source.location)
            return true
        }

        @_effects(readonly)
        public static func _unconditionallyBridgeFromObjectiveC(_ source: ReferenceType?) -> Self {
            Self(count: source!.count, location: source!.location)
        }

        @objc(TallymenReference)
        public final class Reference: NSObject, NSSecureCoding, NSCopying, Sendable {
            public static var supportsSecureCoding: Bool { true }

            @objc public let count: Int
            @objc public let location: String

            public init(count: Int, location: String) {
                self.count = count
                self.location = location
            }

            public convenience init?(coder: NSCoder) {
                guard
                    let count = coder.decodeObject(of: NSNumber.self, forKey: #keyPath(count))?.intValue,
                    let location = coder.decodeObject(of: NSString.self, forKey: #keyPath(location)) as String?
                else { return nil }
                self.init(count: count, location: location)
            }

            public func copy(with zone: NSZone? = nil) -> Any {
                Reference(count: count, location: location)
            }

            override public func isEqual(_ object: Any?) -> Bool {
                switch object {
                case let other as Tallymen:
                    return count == other.count && location == other.location

                case let other as Tallymen.Reference:
                    return count == other.count && location == other.location

                default:
                    return false
                }
            }

            override public var hash: Int {
                var hasher = Hasher()
                hasher.combine(count)
                hasher.combine(location)
                return hasher.finalize()
            }

            public func encode(with coder: NSCoder) {
                coder.encode(count as NSNumber, forKey: #keyPath(count))
                coder.encode(location as NSString, forKey: #keyPath(location))
            }
        }
    }

#endif
