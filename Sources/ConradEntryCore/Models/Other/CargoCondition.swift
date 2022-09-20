//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct CargoCondition: Codable, Hashable, Sendable {
    public let isTrimmed: Bool
    public let isContaminated: Bool
    public let sufferedWaterIngress: Bool
    public let comment: String

    public init(isTrimmed: Bool, isContaminated: Bool, sufferedWaterIngress: Bool, comment: String) {
        self.isTrimmed = isTrimmed
        self.isContaminated = isContaminated
        self.sufferedWaterIngress = sufferedWaterIngress
        self.comment = comment
    }

    public enum CodingKeys: String, CodingKey {
        case isTrimmed, isContaminated, sufferedWaterIngress, comment
    }
}

#if os(macOS) || os(iOS)

    extension CargoCondition: ReferenceConvertible {
        public typealias ReferenceType = Reference
        public typealias _ObjectiveCType = Reference

        public var debugDescription: String {
            description
        }

        public var description: String {
            """
            CargoCondition {
                isTrimmed:            \(isTrimmed)
                isContaminated:       \(isContaminated)
                sufferedWaterIngress: \(sufferedWaterIngress)
                \(comment)
            }
            """
        }

        @_semantics("convertToObjectiveC")
        public func _bridgeToObjectiveC() -> ReferenceType {
            ReferenceType(isTrimmed: isTrimmed, isContaminated: isContaminated, sufferedWaterIngress: sufferedWaterIngress, comment: comment)
        }

        public static func _forceBridgeFromObjectiveC(_ source: ReferenceType, result: inout Self?) {
            result = Self(isTrimmed: source.isTrimmed, isContaminated: source.isContaminated, sufferedWaterIngress: source.sufferedWaterIngress, comment: source.comment)
        }

        public static func _conditionallyBridgeFromObjectiveC(_ source: ReferenceType, result: inout Self?) -> Bool {
            result = Self(isTrimmed: source.isTrimmed, isContaminated: source.isContaminated, sufferedWaterIngress: source.sufferedWaterIngress, comment: source.comment)
            return true
        }

        @_effects(readonly)
        public static func _unconditionallyBridgeFromObjectiveC(_ source: ReferenceType?) -> Self {
            Self(isTrimmed: source!.isTrimmed, isContaminated: source!.isContaminated, sufferedWaterIngress: source!.sufferedWaterIngress, comment: source!.comment)
        }

        @objc(CargoConditionReference)
        public final class Reference: NSObject, NSSecureCoding, NSCopying, Sendable {
            public static var supportsSecureCoding: Bool { true }

            @objc public let isTrimmed: Bool
            @objc public let isContaminated: Bool
            @objc public let sufferedWaterIngress: Bool
            @objc public let comment: String

            public init(isTrimmed: Bool, isContaminated: Bool, sufferedWaterIngress: Bool, comment: String) {
                self.isTrimmed = isTrimmed
                self.isContaminated = isContaminated
                self.sufferedWaterIngress = sufferedWaterIngress
                self.comment = comment
            }

            public convenience init?(coder: NSCoder) {
                guard
                    let isTrimmed = coder.decodeObject(of: NSNumber.self, forKey: #keyPath(isTrimmed))?.boolValue,
                    let isContaminated = coder.decodeObject(of: NSNumber.self, forKey: #keyPath(isContaminated))?.boolValue,
                    let sufferedWaterIngress = coder.decodeObject(of: NSNumber.self, forKey: #keyPath(sufferedWaterIngress))?.boolValue,
                    let comment = coder.decodeObject(of: NSString.self, forKey: #keyPath(comment)) as String?
                else { return nil }
                self.init(isTrimmed: isTrimmed, isContaminated: isContaminated, sufferedWaterIngress: sufferedWaterIngress, comment: comment)
            }

            public func copy(with zone: NSZone? = nil) -> Any {
                self
            }

            override public func isEqual(_ object: Any?) -> Bool {
                switch object {
                case let other as CargoCondition:
                    return isTrimmed == other.isTrimmed && isContaminated == other.isContaminated && sufferedWaterIngress == other.sufferedWaterIngress && comment == other.comment

                case let other as CargoCondition.Reference:
                    return isTrimmed == other.isTrimmed && isContaminated == other.isContaminated && sufferedWaterIngress == other.sufferedWaterIngress && comment == other.comment

                default:
                    return false
                }
            }

            override public var hash: Int {
                var hasher = Hasher()
                hasher.combine(isTrimmed)
                hasher.combine(isContaminated)
                hasher.combine(sufferedWaterIngress)
                hasher.combine(comment)
                return hasher.finalize()
            }

            public func encode(with coder: NSCoder) {
                coder.encode(isTrimmed as NSNumber, forKey: #keyPath(isTrimmed))
                coder.encode(isContaminated as NSNumber, forKey: #keyPath(isContaminated))
                coder.encode(sufferedWaterIngress as NSNumber, forKey: #keyPath(sufferedWaterIngress))
                coder.encode(comment as NSString, forKey: #keyPath(comment))
            }
        }
    }

#endif
