//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public struct QualityLotSamplePreparationDivisionMethod: ConfigurationConstant {
    public let id: Int
    public let value: String
    public let usesRotarySampleDivider: Bool
    public let usesRiffle: Bool
    public let usesIncrementDivision: Bool
    public let representsOtherValue: Bool

    public init(id: Int, value: String, usesRotarySampleDivider: Bool, usesRiffle: Bool, usesIncrementDivision: Bool, representsOtherValue: Bool) {
        self.id = id
        self.value = value
        self.usesRotarySampleDivider = usesRotarySampleDivider
        self.usesRiffle = usesRiffle
        self.usesIncrementDivision = usesIncrementDivision
        self.representsOtherValue = representsOtherValue
    }

    public enum CodingKeys: String, CodingKey {
        case id, value, usesRotarySampleDivider, usesRiffle, usesIncrementDivision, representsOtherValue
    }
}
