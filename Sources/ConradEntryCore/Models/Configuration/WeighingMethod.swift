//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct WeighingMethod: Codable, Identifiable {
    public let id: Int
    public let value: String
    public let usesEquipment: Bool
    public let supportsABCChecks: Bool

    public init(id: Int, value: String, usesEquipment: Bool, supportsABCChecks: Bool) {
        self.id = id
        self.value = value
        self.usesEquipment = usesEquipment
        self.supportsABCChecks = supportsABCChecks
    }
}

public extension WeighingMethod {
    enum CodingKeys: String, CodingKey {
        case id, supportsABCChecks, value, usesEquipment
    }
}
