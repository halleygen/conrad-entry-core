//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public enum CalibrationCheck: Hashable, Codable {
    case singleScale(Result)
    case doubleScale(tare: Result, laden: Result)

    public var isSingleScale: Bool {
        switch self {
        case .singleScale: return true
        case .doubleScale: return false
        }
    }

    // MARK: - Result

    public struct Result: Hashable, Codable {
        public let maxTonnes: Double
        public let maxVarianceKilograms: Double

        public init(maxTonnes: Double, maxVarianceKilograms: Double) {
            self.maxTonnes = maxTonnes
            self.maxVarianceKilograms = maxVarianceKilograms
        }
    }
}
