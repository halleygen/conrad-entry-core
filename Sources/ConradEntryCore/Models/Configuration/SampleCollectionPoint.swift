//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct SampleCollectionPoint: ConfigurationConstant {
    public let id: Int
    public let value: String
    public let isFromTruck: Bool
    public let isSoftDeleted: Bool

    public var representsOtherValue: Bool { false }

    public init(id: Int, value: String, isFromTruck: Bool, isSoftDeleted: Bool) {
        self.id = id
        self.value = value
        self.isFromTruck = isFromTruck
        self.isSoftDeleted = isSoftDeleted
    }
}

public extension SampleCollectionPoint {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id, value, isFromTruck, isSoftDeleted
    }
}
