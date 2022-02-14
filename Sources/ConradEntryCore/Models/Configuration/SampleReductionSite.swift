//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct SampleReductionSite: ConfigurationConstant {
    public let id: Int
    public let value: String
    public let isLabFacility: Bool

    public var representsOtherValue: Bool { false }

    public init(id: Int, value: String, isLabFacility: Bool) {
        self.id = id
        self.value = value
        self.isLabFacility = isLabFacility
    }
}

public extension SampleReductionSite {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id, value, isLabFacility
    }
}
