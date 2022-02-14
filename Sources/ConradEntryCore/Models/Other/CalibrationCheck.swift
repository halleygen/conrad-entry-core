//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public enum CalibrationCheck: Hashable, Codable {
    case singleScale(Result)
    case doubleScale(tare: Result, laden: Result)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let singleResult = try container.decodeIfPresent(Result.self, forKey: .singleResult) {
            self = .singleScale(singleResult)
        } else {
            let tare = try container.decode(Result.self, forKey: .tareResult)
            let laden = try container.decode(Result.self, forKey: .ladenResult)
            self = .doubleScale(tare: tare, laden: laden)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case let .singleScale(result):
            try container.encode(result, forKey: .singleResult)

        case let .doubleScale(tare, laden):
            try container.encode(tare, forKey: .tareResult)
            try container.encode(laden, forKey: .ladenResult)
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

        public enum CodingKeys: String, CodingKey {
            case maxTonnes, maxVarianceKilograms
        }
    }

    // MARK: - CodingKeys

    public enum CodingKeys: String, CodingKey {
        case singleResult, tareResult, ladenResult
    }
}
