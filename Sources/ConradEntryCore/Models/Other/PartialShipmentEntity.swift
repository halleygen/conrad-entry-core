//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public enum PartialShipmentEntity: Codable {
    public typealias CodingKeys = Key

    case details(ShipmentDetailsDTO)
    case billOfLading(BillOfLadingDTO)
    case discharge(DischargeDTO)
    case settlementWeight(DischargeWeightDTO)
    case referenceWeight(DischargeWeightDTO)
    case sampleCollection(SampleCollectionDTO)
    case sampleReduction(SampleReductionDTO)
    case moistureDetermination(MoistureDeterminationDTO)
    case samplePreparation(QualityLotSamplePreparationDTO)

    public var key: Key {
        switch self {
        case .details: return .details
        case .billOfLading: return .billOfLading
        case .discharge: return .discharge
        case .settlementWeight: return .settlementWeight
        case .referenceWeight: return .referenceWeight
        case .sampleCollection: return .sampleCollection
        case .sampleReduction: return .sampleReduction
        case .moistureDetermination: return .moistureDetermination
        case .samplePreparation: return .samplePreparation
        }
    }
}

public extension PartialShipmentEntity {
    enum Key: String, Codable {
        case details
        case billOfLading = "bill-of-lading"
        case discharge
        case settlementWeight = "settlement-weight"
        case referenceWeight = "reference-weight"
        case sampleCollection = "sample-collection"
        case sampleReduction = "sample-reduction"
        case moistureDetermination = "moisture-determination"
        case samplePreparation = "sample-preparation"
    }
}

extension PartialShipmentEntity.Key: LosslessStringConvertible {
    public var description: String { rawValue }

    public init?(_ description: String) {
        self.init(rawValue: description)
    }
}

extension PartialShipmentEntity.Key: CodingKey {
    public var stringValue: String { rawValue }
}

#if swift(<5.5)
    public extension PartialShipmentEntity {
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            if container.allKeys.count != 1 {
                let context = DecodingError.Context(
                    codingPath: container.codingPath,
                    debugDescription: "Invalid number of keys found, expected one."
                )
                throw DecodingError.typeMismatch(PartialShipmentEntity.self, context)
            }

            switch container.allKeys.first.unsafelyUnwrapped {
            case .details:
                self = .details(try container.decode(ShipmentDetailsDTO.self, forKey: .details))
            case .billOfLading:
                self = .billOfLading(try container.decode(BillOfLadingDTO.self, forKey: .billOfLading))
            case .discharge:
                self = .discharge(try container.decode(DischargeDTO.self, forKey: .discharge))
            case .settlementWeight:
                self = .settlementWeight(try container.decode(DischargeWeightDTO.self, forKey: .settlementWeight))
            case .referenceWeight:
                self = .referenceWeight(try container.decode(DischargeWeightDTO.self, forKey: .referenceWeight))
            case .sampleCollection:
                self = .sampleCollection(try container.decode(SampleCollectionDTO.self, forKey: .sampleCollection))
            case .sampleReduction:
                self = .sampleReduction(try container.decode(SampleReductionDTO.self, forKey: .sampleReduction))
            case .moistureDetermination:
                self = .moistureDetermination(try container.decode(MoistureDeterminationDTO.self, forKey: .moistureDetermination))
            case .samplePreparation:
                self = .samplePreparation(try container.decode(QualityLotSamplePreparationDTO.self, forKey: .samplePreparation))
            }
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch self {
            case let .details(shipmentDetailsDTO):
                try container.encode(shipmentDetailsDTO, forKey: .details)
            case let .billOfLading(billOfLadingDTO):
                try container.encode(billOfLadingDTO, forKey: .billOfLading)
            case let .discharge(dischargeDTO):
                try container.encode(dischargeDTO, forKey: .discharge)
            case let .settlementWeight(dischargeWeightDTO):
                try container.encode(dischargeWeightDTO, forKey: .settlementWeight)
            case let .referenceWeight(dischargeWeightDTO):
                try container.encode(dischargeWeightDTO, forKey: .referenceWeight)
            case let .sampleCollection(sampleCollectionDTO):
                try container.encode(sampleCollectionDTO, forKey: .sampleCollection)
            case let .sampleReduction(sampleReductionDTO):
                try container.encode(sampleReductionDTO, forKey: .sampleReduction)
            case let .moistureDetermination(moistureDeterminationDTO):
                try container.encode(moistureDeterminationDTO, forKey: .moistureDetermination)
            case let .samplePreparation(qualityLotSamplePreparationDTO):
                try container.encode(qualityLotSamplePreparationDTO, forKey: .samplePreparation)
            }
        }
    }
#endif
