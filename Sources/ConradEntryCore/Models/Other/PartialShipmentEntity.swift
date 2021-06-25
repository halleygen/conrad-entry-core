//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public enum PartialShipmentEntity: Codable {
    public typealias CodingKeys = Key

    case details(ShipmentDTO)
    case billOfLading(BillOfLadingDTO)
    case discharge(DischargeDTO)
    case dischargeWeight(DischargeWeightDTO)
    case sampleCollection(SampleCollectionDTO)
    case sampleReduction(SampleReductionDTO)
    case moistureDetermination(MoistureDeterminationDTO)
    case samplePreparation(QualityLotSamplePreparationDTO)
}

public extension PartialShipmentEntity {
    enum Key: String, Codable {
        case details
        case billOfLading = "bill-of-lading"
        case discharge
        case dischargeWeight = "discharge-weight"
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
