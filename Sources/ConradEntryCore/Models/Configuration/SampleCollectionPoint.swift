//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct SampleCollectionPoint: Codable, Identifiable {
    public let id: Int
    public let value: String
    public let isFromTruck: Bool

    public init(id: Int, value: String, isFromTruck: Bool) {
        self.id = id
        self.value = value
        self.isFromTruck = isFromTruck
    }
}

extension SampleCollectionPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.value == rhs.value
    }
}

public extension SampleCollectionPoint {
    enum CodingKeys: String, CodingKey {
        case id, value, isFromTruck
    }
}
