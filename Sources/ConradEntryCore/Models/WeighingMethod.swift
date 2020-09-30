//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

public struct WeighingMethod: Codable {
    public let value: String
    public let usesEquipment: Bool
    public let supportsABCChecks: Bool
}

public extension WeighingMethod {
    enum CodingKeys: String, CodingKey {
        case supportsABCChecks, value, usesEquipment
    }
}
