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

extension ShipmentChildEntity: LosslessStringConvertible {
    public var description: String { rawValue }

    public init?(_ description: String) {
        self.init(rawValue: description)
    }
}
