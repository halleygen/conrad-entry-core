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
    public let isSoftDeleted: Bool

    public init(id: Int, value: String, usesRotarySampleDivider: Bool, usesRiffle: Bool, usesIncrementDivision: Bool, representsOtherValue: Bool, isSoftDeleted: Bool) {
        self.id = id
        self.value = value
        self.usesRotarySampleDivider = usesRotarySampleDivider
        self.usesRiffle = usesRiffle
        self.usesIncrementDivision = usesIncrementDivision
        self.representsOtherValue = representsOtherValue
        self.isSoftDeleted = isSoftDeleted
    }

    public enum CodingKeys: String, CodingKey {
        case id, value, usesRotarySampleDivider, usesRiffle, usesIncrementDivision, representsOtherValue, isSoftDeleted
    }
}
