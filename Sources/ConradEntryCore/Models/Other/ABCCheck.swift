//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public struct ABCCheck: Hashable, Codable {
    public let tareWeightVarianceKilograms: Double
    public let ladenWeightVarianceKilograms: Double

    public init(tareWeightVarianceKilograms: Double, ladenWeightVarianceKilograms: Double) {
        self.tareWeightVarianceKilograms = tareWeightVarianceKilograms
        self.ladenWeightVarianceKilograms = ladenWeightVarianceKilograms
    }

    public enum CodingKeys: String, CodingKey {
        case tareWeightVarianceKilograms, ladenWeightVarianceKilograms
    }
}
