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
    case samplePreparation(SamplePreparationDTO)

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
