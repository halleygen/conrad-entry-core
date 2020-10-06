//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

public struct WeighingMethod: Codable {
    public let value: String
    public let usesEquipment: Bool
    public let supportsABCChecks: Bool

    public init(value: String, usesEquipment: Bool, supportsABCChecks: Bool) {
        self.value = value
        self.usesEquipment = usesEquipment
        self.supportsABCChecks = supportsABCChecks
    }
}

public extension WeighingMethod {
    enum CodingKeys: String, CodingKey {
        case supportsABCChecks, value, usesEquipment
    }
}
