//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public enum AttachmentRole: Hashable {
    case special(SpecialRole)
    case billOfLading
    case sampleCollection
    case sampleReduction
    case moistureDetermination
    case samplePreparation

    public enum SpecialRole: String, Codable, Hashable {
        case noticeOfReadiness, vesselPhoto, statementOfFacts, moistureCertificate, lotByLotMoistureProfile, stowagePlan
    }

    private enum CodingKeys: String, CodingKey {
        case special
        case billOfLading
        case sampleCollection
        case sampleReduction
        case moistureDetermination
        case samplePreparation
    }
}

extension AttachmentRole: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let description = try container.decode(String.self)
        if let role = Self(description) {
            self = role
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Could not parse role from description string: '\(description)'")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }
}

extension AttachmentRole: LosslessStringConvertible {
    public var description: String {
        switch self {
        case let .special(id):
            return CodingKeys.special.rawValue + ":" + id.rawValue
        case .billOfLading:
            return CodingKeys.billOfLading.rawValue
        case .sampleCollection:
            return CodingKeys.sampleCollection.rawValue
        case .sampleReduction:
            return CodingKeys.sampleReduction.rawValue
        case .moistureDetermination:
            return CodingKeys.moistureDetermination.rawValue
        case .samplePreparation:
            return CodingKeys.samplePreparation.rawValue
        }
    }

    public init?(_ description: String) {
        if let key = CodingKeys(rawValue: description) {
            switch key {
            case .special:
                return nil
            case .billOfLading:
                self = .billOfLading
            case .sampleCollection:
                self = .sampleCollection
            case .sampleReduction:
                self = .sampleReduction
            case .moistureDetermination:
                self = .moistureDetermination
            case .samplePreparation:
                self = .samplePreparation
            }
            return
        }

        let split = description.split(separator: ":")
        guard split.count == 2, let specialRole = SpecialRole(rawValue: String(split[1])) else { return nil }
        self = .special(specialRole)
    }
}
