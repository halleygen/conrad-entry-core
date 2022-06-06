//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct ABCCheck: Hashable, Codable {
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
