//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct QualityLotScreening: Codable, Hashable, Sendable {
    public var screenApertureID: Int
    public var oversizePulverizedSeparately: Bool

    public init(screenApertureID: Int, oversizePulverizedSeparately: Bool) {
        self.screenApertureID = screenApertureID
        self.oversizePulverizedSeparately = oversizePulverizedSeparately
    }
}

#if os(macOS) || os(iOS)

    import Foundation

    extension QualityLotScreening: ReferenceConvertible {
        public typealias ReferenceType = Reference
        public typealias _ObjectiveCType = Reference

        public var debugDescription: String {
            description
        }

        public var description: String {
            "QualityLotScreening(apertureID: \(screenApertureID), oversizePulverizedSeparately: \(oversizePulverizedSeparately))"
        }

        @_semantics("convertToObjectiveC")
        public func _bridgeToObjectiveC() -> ReferenceType {
            ReferenceType(screenApertureID: screenApertureID, oversizePulverizedSeparately: oversizePulverizedSeparately)
        }

        public static func _forceBridgeFromObjectiveC(_ source: ReferenceType, result: inout Self?) {
            result = Self(screenApertureID: source.screenApertureID, oversizePulverizedSeparately: source.oversizePulverizedSeparately)
        }

        public static func _conditionallyBridgeFromObjectiveC(_ source: ReferenceType, result: inout Self?) -> Bool {
            result = Self(screenApertureID: source.screenApertureID, oversizePulverizedSeparately: source.oversizePulverizedSeparately)
            return true
        }

        @_effects(readonly)
        public static func _unconditionallyBridgeFromObjectiveC(_ source: ReferenceType?) -> Self {
            Self(screenApertureID: source!.screenApertureID, oversizePulverizedSeparately: source!.oversizePulverizedSeparately)
        }

        @objc(QualityLotScreeningReference)
        public final class Reference: NSObject, NSSecureCoding, NSCopying, Sendable {
            public static var supportsSecureCoding: Bool { true }

            @objc public let screenApertureID: Int
            @objc public let oversizePulverizedSeparately: Bool

            public init(screenApertureID: Int, oversizePulverizedSeparately: Bool) {
                self.screenApertureID = screenApertureID
                self.oversizePulverizedSeparately = oversizePulverizedSeparately
            }

            public convenience init?(coder: NSCoder) {
                guard
                    let screenApertureID = coder.decodeObject(of: NSNumber.self, forKey: #keyPath(screenApertureID))?.intValue,
                    let oversizePulverizedSeparately = coder.decodeObject(of: NSNumber.self, forKey: #keyPath(oversizePulverizedSeparately))?.boolValue
                else { return nil }
                self.init(screenApertureID: screenApertureID, oversizePulverizedSeparately: oversizePulverizedSeparately)
            }

            public func copy(with zone: NSZone? = nil) -> Any {
                self
            }

            override public func isEqual(_ object: Any?) -> Bool {
                switch object {
                case let other as QualityLotScreening:
                    return screenApertureID == other.screenApertureID && oversizePulverizedSeparately == other.oversizePulverizedSeparately

                case let other as QualityLotScreening.Reference:
                    return screenApertureID == other.screenApertureID && oversizePulverizedSeparately == other.oversizePulverizedSeparately

                default:
                    return false
                }
            }

            override public var hash: Int {
                var hasher = Hasher()
                hasher.combine(screenApertureID)
                hasher.combine(oversizePulverizedSeparately)
                return hasher.finalize()
            }

            public func encode(with coder: NSCoder) {
                coder.encode(screenApertureID as NSNumber, forKey: #keyPath(screenApertureID))
                coder.encode(oversizePulverizedSeparately as NSNumber, forKey: #keyPath(oversizePulverizedSeparately))
            }
        }
    }

#endif
