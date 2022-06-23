//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct SampleReductionMethod: ConfigurationConstant {
    public let id: Int
    public let value: String
    public let usesGrid: Bool
    public let representsOtherValue: Bool
    public let isDeleted: Bool

    public init(id: Int, value: String, usesGrid: Bool, representsOtherValue: Bool = false, isDeleted: Bool = false) {
        self.id = id
        self.value = value
        self.usesGrid = usesGrid
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }
}

public extension SampleReductionMethod {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id, value, usesGrid, representsOtherValue, isDeleted
    }
}
