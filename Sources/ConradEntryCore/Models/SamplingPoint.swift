//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

public struct SamplingPoint: Codable {
    public let value: String
    public let isFromTruck: Bool

    public init(value: String, isFromTruck: Bool) {
        self.value = value
        self.isFromTruck = isFromTruck
    }
}

extension SamplingPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.value == rhs.value
    }
}

public extension SamplingPoint {
    enum CodingKeys: String, CodingKey {
        case value, isFromTruck
    }
}
