//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public enum CalibrationCheck: Hashable, Codable, Sendable {
    case singleScale(Result)
    case doubleScale(tare: Result, laden: Result)

    public var isSingleScale: Bool {
        switch self {
        case .singleScale: return true
        case .doubleScale: return false
        }
    }

    // MARK: - Result

    public struct Result: Hashable, Codable, Sendable {
        public let maxTonnes: Double
        public let maxVarianceKilograms: Double

        public init(maxTonnes: Double, maxVarianceKilograms: Double) {
            self.maxTonnes = maxTonnes
            self.maxVarianceKilograms = maxVarianceKilograms
        }
    }
}

#if os(macOS) || os(iOS)

    import Foundation

    extension CalibrationCheck: ReferenceConvertible {
        public typealias ReferenceType = Reference
        public typealias _ObjectiveCType = Reference

        init?(_ referenceType: ReferenceType) {
            switch referenceType.scale {
            case .single:
                guard let result = referenceType.singleScaleResult else { return nil }
                self = .singleScale(Result(maxTonnes: result.maxTonnes, maxVarianceKilograms: result.maxVarianceKilograms))

            case .double:
                guard let tare = referenceType.doubleScaleTareResult, let laden = referenceType.doubleScaleLadenResult else { return nil }
                self = .doubleScale(tare: Result(maxTonnes: tare.maxTonnes, maxVarianceKilograms: tare.maxVarianceKilograms), laden: Result(maxTonnes: laden.maxTonnes, maxVarianceKilograms: laden.maxVarianceKilograms))
            }
        }

        public var debugDescription: String {
            description
        }

        public var description: String {
            switch self {
            case let .singleScale(result):
                return "SingleScaleCalibrationCheck(maxTonnes: \(result.maxTonnes.formatted())), maxVariableKilos: \(result.maxVarianceKilograms.formatted()))"
            case let .doubleScale(tare, laden):
                return """
                DoubleScaleCalibrationCheck {
                    tare(maxTonnes: \(tare.maxTonnes.formatted())), maxVariableKilos: \(tare.maxVarianceKilograms.formatted()))
                    laden(maxTonnes: \(laden.maxTonnes.formatted())), maxVariableKilos: \(laden.maxVarianceKilograms.formatted()))
                }
                """
            }
        }

        @_semantics("convertToObjectiveC")
        public func _bridgeToObjectiveC() -> ReferenceType {
            ReferenceType(self)
        }

        public static func _forceBridgeFromObjectiveC(_ source: ReferenceType, result: inout Self?) {
            result = Self(source)!
        }

        public static func _conditionallyBridgeFromObjectiveC(_ source: ReferenceType, result: inout Self?) -> Bool {
            result = Self(source)
            return result != nil
        }

        @_effects(readonly)
        public static func _unconditionallyBridgeFromObjectiveC(_ source: ReferenceType?) -> Self {
            Self(source!)!
        }

        @objc(CalibrationCheckReference)
        public final class Reference: NSObject, NSSecureCoding, NSCopying, Sendable {
            public static var supportsSecureCoding: Bool { true }

            @objc public let scale: Scale
            @objc public let singleScaleResult: Result?
            @objc public let doubleScaleTareResult: Result?
            @objc public let doubleScaleLadenResult: Result?

            public init(singleScaleResult: Result) {
                self.scale = .single
                self.singleScaleResult = singleScaleResult
                self.doubleScaleTareResult = nil
                self.doubleScaleLadenResult = nil
            }

            public init(tareResult: Result, ladenResult: Result) {
                self.scale = .double
                self.singleScaleResult = nil
                self.doubleScaleTareResult = tareResult
                self.doubleScaleLadenResult = ladenResult
            }

            public convenience init(_ check: CalibrationCheck) {
                switch check {
                case let .singleScale(result):
                    self.init(singleScaleResult: Result(maxTonnes: result.maxTonnes, maxVarianceKilograms: result.maxVarianceKilograms))

                case let .doubleScale(tare, laden):
                    self.init(tareResult: Result(maxTonnes: tare.maxTonnes, maxVarianceKilograms: tare.maxVarianceKilograms), ladenResult: Result(maxTonnes: laden.maxTonnes, maxVarianceKilograms: laden.maxVarianceKilograms))
                }
            }

            public convenience init?(coder: NSCoder) {
                if let singleScaleResult = coder.decodeObject(of: Result.self, forKey: #keyPath(singleScaleResult)) {
                    self.init(singleScaleResult: singleScaleResult)
                } else if let doubleScaleTareResult = coder.decodeObject(of: Result.self, forKey: #keyPath(doubleScaleTareResult)), let doubleScaleLadenResult = coder.decodeObject(of: Result.self, forKey: #keyPath(doubleScaleLadenResult)) {
                    self.init(tareResult: doubleScaleTareResult, ladenResult: doubleScaleLadenResult)
                } else {
                    return nil
                }
            }

            public func copy(with zone: NSZone? = nil) -> Any {
                self
            }

            override public func isEqual(_ object: Any?) -> Bool {
                switch object {
                case let other as CalibrationCheck:
                    switch other {
                    case let .singleScale(result):
                        return scale == .single
                            && singleScaleResult?.maxTonnes == result.maxTonnes
                            && singleScaleResult?.maxVarianceKilograms == result.maxVarianceKilograms
                            && doubleScaleTareResult == nil
                            && doubleScaleLadenResult == nil

                    case let .doubleScale(tare, laden):
                        return scale == .double
                            && singleScaleResult == nil
                            && doubleScaleTareResult?.maxTonnes == tare.maxTonnes
                            && doubleScaleTareResult?.maxVarianceKilograms == tare.maxVarianceKilograms
                            && doubleScaleLadenResult?.maxTonnes == laden.maxTonnes
                            && doubleScaleLadenResult?.maxVarianceKilograms == laden.maxVarianceKilograms
                    }

                case let other as CalibrationCheck.Reference:
                    return scale == other.scale && singleScaleResult == other.singleScaleResult && doubleScaleTareResult == other.doubleScaleTareResult && doubleScaleLadenResult == other.doubleScaleLadenResult

                default:
                    return false
                }
            }

            override public var hash: Int {
                var hasher = Hasher()
                hasher.combine(scale)
                hasher.combine(singleScaleResult?.maxTonnes)
                hasher.combine(singleScaleResult?.maxVarianceKilograms)
                hasher.combine(doubleScaleTareResult?.maxTonnes)
                hasher.combine(doubleScaleTareResult?.maxVarianceKilograms)
                hasher.combine(doubleScaleLadenResult?.maxTonnes)
                hasher.combine(doubleScaleLadenResult?.maxVarianceKilograms)
                return hasher.finalize()
            }

            public func encode(with coder: NSCoder) {
                switch scale {
                case .single:
                    coder.encode(singleScaleResult!, forKey: #keyPath(singleScaleResult))

                case .double:
                    coder.encode(doubleScaleTareResult!, forKey: #keyPath(doubleScaleTareResult))
                    coder.encode(doubleScaleLadenResult!, forKey: #keyPath(doubleScaleLadenResult))
                }
            }
        }
    }

    public extension CalibrationCheck.Reference {
        @objc(CalibrationCheckReferenceScale)
        enum Scale: Int, Sendable {
            case single = 1, double = 2
        }

        @objc(CalibrationCheckReferenceResult)
        final class Result: NSObject, NSSecureCoding, NSCopying, Sendable {
            public static var supportsSecureCoding: Bool { true }

            @objc public let maxTonnes: Double
            @objc public let maxVarianceKilograms: Double

            public init(maxTonnes: Double, maxVarianceKilograms: Double) {
                self.maxTonnes = maxTonnes
                self.maxVarianceKilograms = maxVarianceKilograms
            }

            public convenience init?(coder: NSCoder) {
                guard
                    let maxTonnes = coder.decodeObject(of: NSNumber.self, forKey: #keyPath(maxTonnes))?.doubleValue,
                    let maxVarianceKilograms = coder.decodeObject(of: NSNumber.self, forKey: #keyPath(maxVarianceKilograms))?.doubleValue
                else { return nil }
                self.init(maxTonnes: maxTonnes, maxVarianceKilograms: maxVarianceKilograms)
            }

            override public func isEqual(_ object: Any?) -> Bool {
                switch object {
                case let other as Result:
                    return maxTonnes == other.maxTonnes && maxVarianceKilograms == other.maxVarianceKilograms

                case let other as CalibrationCheck.Result:
                    return maxTonnes == other.maxTonnes && maxVarianceKilograms == other.maxVarianceKilograms

                default:
                    return false
                }
            }

            override public var hash: Int {
                var hasher = Hasher()
                hasher.combine(maxTonnes)
                hasher.combine(maxVarianceKilograms)
                return hasher.finalize()
            }

            public func copy(with zone: NSZone? = nil) -> Any {
                Result(maxTonnes: maxTonnes, maxVarianceKilograms: maxVarianceKilograms)
            }

            public func encode(with coder: NSCoder) {
                coder.encode(maxTonnes as NSNumber, forKey: #keyPath(maxTonnes))
                coder.encode(maxVarianceKilograms as NSNumber, forKey: #keyPath(maxVarianceKilograms))
            }
        }
    }

#endif
