//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public protocol ShipmentChildMutationRequest: Codable, Identifiable, Hashable {
    func eraseToAnyMutationRequest() -> AnyShipmentChildMutationRequest
}

public protocol ShipmentChildDTO: Codable, Identifiable, Hashable {
    func eraseToAnyDTO() -> AnyShipmentChildDTO
}

public enum ShipmentPart: String, CodingKey, Codable, LosslessStringConvertible {
    case details
    case billOfLading = "bill-of-lading"
    case discharge
    case dischargeWeight = "discharge-weight"
    case sampleCollection = "sample-collection"
    case sampleReduction = "sample-reduction"
    case moistureDetermination = "moisture-determination"
    case samplePreparation = "sample-preparation"

    public init?(_ description: String) {
        self.init(rawValue: description)
    }
}

public enum AnyShipmentChildMutationRequest: Codable {
    case details(request: MutateShipmentDetailsRequest)
    case billOfLading(request: MutateBillOfLadingRequest)
    case discharge(request: MutateDischargeRequest)
    case dischargeWeight(request: MutateDischargeWeightRequest)
    case sampleCollection(request: MutateSampleCollectionRequest)
    case sampleReduction(request: MutateSampleReductionRequest)
    case moistureDetermination(request: MutateMoistureDeterminationRequest)
    case samplePreparation(request: MutateSamplePreparationRequest)

    var part: ShipmentPart {
        switch self {
        case .details: return .details
        case .billOfLading: return .billOfLading
        case .discharge: return .discharge
        case .dischargeWeight: return .dischargeWeight
        case .sampleCollection: return .sampleCollection
        case .sampleReduction: return .sampleReduction
        case .moistureDetermination: return .moistureDetermination
        case .samplePreparation: return .samplePreparation
        }
    }

    static func == (lhs: Self, rhs: ShipmentPart) -> Bool {
        switch (lhs, rhs) {
        case (.details, .details),
             (.billOfLading, .billOfLading),
             (.discharge, .discharge),
             (.dischargeWeight, .dischargeWeight),
             (.sampleCollection, .sampleCollection),
             (.sampleReduction, .sampleReduction),
             (.moistureDetermination, .moistureDetermination),
             (.samplePreparation, .samplePreparation):
            return true

        default:
            return false
        }
    }
}

public enum AnyShipmentChildDTO: Codable {
    case details(details: ShipmentDetailsDTO)
    case billOfLading(billOfLading: BillOfLadingDTO)
    case discharge(discharge: DischargeDTO)
    case dischargeWeight(dischargeWeight: DischargeWeightDTO)
    case sampleCollection(sampleCollection: SampleCollectionDTO)
    case sampleReduction(sampleReduction: SampleReductionDTO)
    case moistureDetermination(moistureDetermination: MoistureDeterminationDTO)
    case samplePreparation(samplePreparation: SamplePreparationDTO)

    var part: ShipmentPart {
        switch self {
        case .details: return .details
        case .billOfLading: return .billOfLading
        case .discharge: return .discharge
        case .dischargeWeight: return .dischargeWeight
        case .sampleCollection: return .sampleCollection
        case .sampleReduction: return .sampleReduction
        case .moistureDetermination: return .moistureDetermination
        case .samplePreparation: return .samplePreparation
        }
    }

    static func == (lhs: Self, rhs: ShipmentPart) -> Bool {
        switch (lhs, rhs) {
        case (.details, .details),
             (.billOfLading, .billOfLading),
             (.discharge, .discharge),
             (.dischargeWeight, .dischargeWeight),
             (.sampleCollection, .sampleCollection),
             (.sampleReduction, .sampleReduction),
             (.moistureDetermination, .moistureDetermination),
             (.samplePreparation, .samplePreparation):
            return true

        default:
            return false
        }
    }
}
