//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

public struct SamplingTransparency: Codable {
    public let value: String
    public let ranking: Int16

    public init(value: String, ranking: Int16) {
        self.value = value
        self.ranking = ranking
    }
}

extension SamplingTransparency: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ranking)
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.ranking == rhs.ranking
    }
}

extension SamplingTransparency: Comparable {
    public static func < (lhs: SamplingTransparency, rhs: SamplingTransparency) -> Bool {
        lhs.ranking < rhs.ranking
    }
}

public extension SamplingTransparency {
    enum CodingKeys: String, CodingKey {
        case value, ranking
    }
}
