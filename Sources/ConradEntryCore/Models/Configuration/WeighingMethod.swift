//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct WeighingMethod: ConfigurationConstant {
    public let id: Int
    public let value: String
    public let usesEquipment: Bool
    public let usesTallymen: Bool
    public let supportsABCChecks: Bool
    public let isDeleted: Bool

    public var representsOtherValue: Bool { false }

    public init(id: Int, value: String, usesEquipment: Bool, usesTallymen: Bool, supportsABCChecks: Bool, isDeleted: Bool = false) {
        self.id = id
        self.value = value
        self.usesEquipment = usesEquipment
        self.usesTallymen = usesTallymen
        self.supportsABCChecks = supportsABCChecks
        self.isDeleted = isDeleted
    }
}

public extension WeighingMethod {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id, supportsABCChecks, value, usesEquipment, usesTallymen, isDeleted
    }
}
