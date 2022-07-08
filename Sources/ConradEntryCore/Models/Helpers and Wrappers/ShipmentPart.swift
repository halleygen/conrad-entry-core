//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public enum ShipmentPart: String, LosslessStringConvertible {
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

    public var description: String { rawValue }
}
