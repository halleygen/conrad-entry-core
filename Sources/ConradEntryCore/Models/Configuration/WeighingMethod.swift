//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct WeighingMethod: Codable, Identifiable {
    public let id: UUID
    public let value: String
    public let usesEquipment: Bool
    public let supportsABCChecks: Bool

    public init(id: UUID, value: String, usesEquipment: Bool, supportsABCChecks: Bool) {
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
