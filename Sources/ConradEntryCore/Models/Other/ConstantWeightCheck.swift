//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct ConstantWeightCheck: Hashable, Codable {
    public var duration: TimeInterval
    public var numberOfWeighBacks: Int

    public init(duration: TimeInterval, numberOfWeighBacks: Int) {
        self.duration = duration
        self.numberOfWeighBacks = numberOfWeighBacks
    }
}

public extension ConstantWeightCheck {
    var durationInHours: Double {
        get { Measurement<UnitDuration>(value: duration, unit: .seconds).converted(to: .hours).value }
        set { duration = Measurement<UnitDuration>(value: newValue, unit: .hours).converted(to: .seconds).value }
    }
}

#if os(macOS) || os(iOS)

    extension ConstantWeightCheck: ReferenceConvertible {
        public typealias ReferenceType = Reference
        public typealias _ObjectiveCType = Reference

        public var debugDescription: String {
            description
        }

        public var description: String {
            "ConstantWeightCheck(duration: \(duration.formatted())s, numberOfWeighBacks: \(numberOfWeighBacks.formatted()))"
        }

        @_semantics("convertToObjectiveC")
        public func _bridgeToObjectiveC() -> ReferenceType {
            ReferenceType(duration: duration, numberOfWeighBacks: numberOfWeighBacks)
        }

        public static func _forceBridgeFromObjectiveC(_ source: ReferenceType, result: inout Self?) {
            result = Self(duration: source.duration, numberOfWeighBacks: source.numberOfWeighBacks)
        }

        public static func _conditionallyBridgeFromObjectiveC(_ source: ReferenceType, result: inout Self?) -> Bool {
            result = Self(duration: source.duration, numberOfWeighBacks: source.numberOfWeighBacks)
            return true
        }

        @_effects(readonly)
        public static func _unconditionallyBridgeFromObjectiveC(_ source: ReferenceType?) -> Self {
            Self(duration: source!.duration, numberOfWeighBacks: source!.numberOfWeighBacks)
        }

        @objc(ConstantWeightCheckReference)
        public final class Reference: NSObject, NSSecureCoding, NSCopying {
            public static var supportsSecureCoding: Bool { true }

            @objc public let duration: TimeInterval
            @objc public let numberOfWeighBacks: Int

            public init(duration: TimeInterval, numberOfWeighBacks: Int) {
                self.duration = duration
                self.numberOfWeighBacks = numberOfWeighBacks
            }

            public init?(coder: NSCoder) {
                guard
                    let numberOfWeighBacks = coder.decodeObject(of: NSNumber.self, forKey: #keyPath(numberOfWeighBacks))?.intValue,
                    let duration = coder.decodeObject(of: NSNumber.self, forKey: #keyPath(duration))?.doubleValue
                else { return nil }
                self.duration = duration
                self.numberOfWeighBacks = numberOfWeighBacks
            }

            override public func isEqual(_ object: Any?) -> Bool {
                switch object {
                case let other as ConstantWeightCheck.Reference:
                    return duration == other.duration && numberOfWeighBacks == other.numberOfWeighBacks

                case let other as ConstantWeightCheck:
                    return duration == other.duration && numberOfWeighBacks == other.numberOfWeighBacks

                default:
                    return false
                }
            }

            override public var hash: Int {
                var hasher = Hasher()
                hasher.combine(duration)
                hasher.combine(numberOfWeighBacks)
                return hasher.finalize()
            }

            public func copy(with zone: NSZone? = nil) -> Any {
                ConstantWeightCheck.Reference(duration: duration, numberOfWeighBacks: numberOfWeighBacks)
            }

            public func encode(with coder: NSCoder) {
                coder.encode(duration as NSNumber, forKey: #keyPath(duration))
                coder.encode(numberOfWeighBacks as NSNumber, forKey: #keyPath(numberOfWeighBacks))
            }
        }
    }

#endif
