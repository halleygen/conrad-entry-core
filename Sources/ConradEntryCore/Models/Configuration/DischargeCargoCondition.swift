//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct DischargeCargoCondition: Codable, Identifiable {
    public let id: Int
    public let value: String
    public let ranking: Int

    public init(id: Int, value: String, ranking: Int) {
        self.id = id
        self.value = value
        self.ranking = ranking
    }
}

extension DischargeCargoCondition: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

extension DischargeCargoCondition: Comparable {
    public static func < (lhs: DischargeCargoCondition, rhs: DischargeCargoCondition) -> Bool {
        lhs.ranking < rhs.ranking
    }
}

public extension DischargeCargoCondition {
    enum CodingKeys: String, CodingKey {
        case id, value, ranking
    }
}
