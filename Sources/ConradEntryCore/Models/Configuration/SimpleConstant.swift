//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct SimpleConstant: ConfigurationConstant {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(id: Int, value: String, representsOtherValue: Bool, isDeleted: Bool = false) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }
}

public extension SimpleConstant {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id, value, representsOtherValue, isDeleted
    }
}
