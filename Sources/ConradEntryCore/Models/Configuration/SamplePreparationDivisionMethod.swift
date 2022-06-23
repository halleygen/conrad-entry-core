//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct SamplePreparationDivisionMethod: ConfigurationConstant {
    public let id: Int
    public let value: String
    public let usesRotarySampleDivider: Bool
    public let usesRiffle: Bool
    public let usesIncrementDivision: Bool
    public let representsOtherValue: Bool
    public let isDeleted: Bool

    public init(id: Int, value: String, usesRotarySampleDivider: Bool, usesRiffle: Bool, usesIncrementDivision: Bool, representsOtherValue: Bool, isDeleted: Bool = false) {
        self.id = id
        self.value = value
        self.usesRotarySampleDivider = usesRotarySampleDivider
        self.usesRiffle = usesRiffle
        self.usesIncrementDivision = usesIncrementDivision
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public enum CodingKeys: String, CodingKey {
        case id, value, usesRotarySampleDivider, usesRiffle, usesIncrementDivision, representsOtherValue, isDeleted
    }
}
