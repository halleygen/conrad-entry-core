//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public enum ShipmentChildEntity: String, Codable {
    case billOfLading = "bill-of-lading"
    case discharge
    case settlementWeight = "settlement-weight"
    case referenceWeight = "reference-weight"
    case sampleCollection = "sample-collection"
    case sampleReduction = "sample-reduction"
    case moistureDetermination = "moisture-determination"
    case samplePreparation = "sample-preparation"
}
