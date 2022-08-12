//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct ABCCheck: Hashable, Codable, Sendable {
    public var tareWeightVarianceKilograms: Double
    public var ladenWeightVarianceKilograms: Double

    public init(tareWeightVarianceKilograms: Double, ladenWeightVarianceKilograms: Double) {
        self.tareWeightVarianceKilograms = tareWeightVarianceKilograms
        self.ladenWeightVarianceKilograms = ladenWeightVarianceKilograms
    }

    public enum CodingKeys: String, CodingKey {
        case tareWeightVarianceKilograms, ladenWeightVarianceKilograms
    }
}

#if os(macOS) || os(iOS)

    import Foundation

    extension ABCCheck: ReferenceConvertible {
        public typealias ReferenceType = Reference
        public typealias _ObjectiveCType = Reference

        public var debugDescription: String {
            description
        }

        public var description: String {
            """
            ABCCheck {
                tareVariance:  \(tareWeightVarianceKilograms.formatted())kg
                ladenVariance: \(ladenWeightVarianceKilograms.formatted())kg
            }
            """
        }

        @_semantics("convertToObjectiveC")
        public func _bridgeToObjectiveC() -> ReferenceType {
            ReferenceType(tareWeightVarianceKilograms: tareWeightVarianceKilograms, ladenWeightVarianceKilograms: ladenWeightVarianceKilograms)
        }

        public static func _forceBridgeFromObjectiveC(_ source: ReferenceType, result: inout Self?) {
            result = Self(tareWeightVarianceKilograms: source.tareWeightVarianceKilograms, ladenWeightVarianceKilograms: source.ladenWeightVarianceKilograms)
        }

        public static func _conditionallyBridgeFromObjectiveC(_ source: ReferenceType, result: inout Self?) -> Bool {
            result = Self(tareWeightVarianceKilograms: source.tareWeightVarianceKilograms, ladenWeightVarianceKilograms: source.ladenWeightVarianceKilograms)
            return true
        }

        @_effects(readonly)
        public static func _unconditionallyBridgeFromObjectiveC(_ source: ReferenceType?) -> Self {
            Self(tareWeightVarianceKilograms: source!.tareWeightVarianceKilograms, ladenWeightVarianceKilograms: source!.ladenWeightVarianceKilograms)
        }

        @objc(ABCCheckReference)
        public final class Reference: NSObject, NSSecureCoding, NSCopying, Sendable {
            public static var supportsSecureCoding: Bool { true }

            @objc public let tareWeightVarianceKilograms: Double
            @objc public let ladenWeightVarianceKilograms: Double

            public init(tareWeightVarianceKilograms: Double, ladenWeightVarianceKilograms: Double) {
                self.tareWeightVarianceKilograms = tareWeightVarianceKilograms
                self.ladenWeightVarianceKilograms = ladenWeightVarianceKilograms
            }

            public convenience init?(coder: NSCoder) {
                guard
                    let tareWeightVarianceKilograms = coder.decodeObject(of: NSNumber.self, forKey: #keyPath(tareWeightVarianceKilograms))?.doubleValue,
                    let ladenWeightVarianceKilograms = coder.decodeObject(of: NSNumber.self, forKey: #keyPath(ladenWeightVarianceKilograms))?.doubleValue
                else { return nil }
                self.init(tareWeightVarianceKilograms: tareWeightVarianceKilograms, ladenWeightVarianceKilograms: ladenWeightVarianceKilograms)
            }

            public func copy(with zone: NSZone? = nil) -> Any {
                Reference(tareWeightVarianceKilograms: tareWeightVarianceKilograms, ladenWeightVarianceKilograms: ladenWeightVarianceKilograms)
            }

            override public func isEqual(_ object: Any?) -> Bool {
                switch object {
                case let other as ABCCheck:
                    return tareWeightVarianceKilograms == other.tareWeightVarianceKilograms && ladenWeightVarianceKilograms == other.ladenWeightVarianceKilograms

                case let other as ABCCheck.Reference:
                    return tareWeightVarianceKilograms == other.tareWeightVarianceKilograms && ladenWeightVarianceKilograms == other.ladenWeightVarianceKilograms

                default:
                    return false
                }
            }

            override public var hash: Int {
                var hasher = Hasher()
                hasher.combine(tareWeightVarianceKilograms)
                hasher.combine(ladenWeightVarianceKilograms)
                return hasher.finalize()
            }

            public func encode(with coder: NSCoder) {
                coder.encode(tareWeightVarianceKilograms as NSNumber, forKey: #keyPath(tareWeightVarianceKilograms))
                coder.encode(ladenWeightVarianceKilograms as NSNumber, forKey: #keyPath(ladenWeightVarianceKilograms))
            }
        }
    }

#endif
