//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct SamplingTransparency: ConfigurationConstant {
    public let id: Int
    public let value: String
    public let ranking: Int
    public let isSoftDeleted: Bool

    public var representsOtherValue: Bool { false }

    public init(id: Int, value: String, ranking: Int, isSoftDeleted: Bool) {
        self.id = id
        self.value = value
        self.ranking = ranking
        self.isSoftDeleted = isSoftDeleted
    }
}

extension SamplingTransparency: Comparable {
    public static func < (lhs: SamplingTransparency, rhs: SamplingTransparency) -> Bool {
        lhs.ranking < rhs.ranking
    }
}

public extension SamplingTransparency {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id, value, ranking, isSoftDeleted
    }
}
