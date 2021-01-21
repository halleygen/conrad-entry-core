//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public struct CalibrationCheck: Hashable, Codable {
    public let maxTonnes: Double
    public let maxVarianceKilograms: Double

    public init(maxTonnes: Double, maxVarianceKilograms: Double) {
        self.maxTonnes = maxTonnes
        self.maxVarianceKilograms = maxVarianceKilograms
    }

    public enum CodingKeys: String, CodingKey {
        case maxTonnes, maxVarianceKilograms
    }
}
