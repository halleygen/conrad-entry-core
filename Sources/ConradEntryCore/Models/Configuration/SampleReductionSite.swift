//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct SampleReductionSite: ConfigurationConstant {
    public let id: Int
    public let value: String
    public let isLabFacility: Bool
    public let isDeleted: Bool

    public var representsOtherValue: Bool { false }

    public init(id: Int, value: String, isLabFacility: Bool, isDeleted: Bool) {
        self.id = id
        self.value = value
        self.isLabFacility = isLabFacility
        self.isDeleted = isDeleted
    }
}

public extension SampleReductionSite {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id, value, isLabFacility, isDeleted
    }
}
