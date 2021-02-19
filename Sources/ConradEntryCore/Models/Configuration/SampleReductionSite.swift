//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public struct SampleReductionSite: Codable, Identifiable {
    public let id: Int
    public let value: String
    public let isLabFacility: Bool

    public init(id: Int, value: String, isLabFacility: Bool) {
        self.id = id
        self.value = value
        self.isLabFacility = isLabFacility
    }
}

extension SampleReductionSite: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.value == rhs.value
    }
}

public extension SampleReductionSite {
    enum CodingKeys: String, CodingKey {
        case id, value, isLabFacility
    }
}
