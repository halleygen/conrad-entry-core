//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct CargoConditionDTO: Codable, Hashable {
    public let isUntrimmed: Bool
    public let isContaminated: Bool
    public let sufferedWaterIngress: Bool
    public let comment: String

    public init(isUntrimmed: Bool, isContaminated: Bool, sufferedWaterIngress: Bool, comment: String) {
        self.isUntrimmed = isUntrimmed
        self.isContaminated = isContaminated
        self.sufferedWaterIngress = sufferedWaterIngress
        self.comment = comment
    }

    public enum CodingKeys: String, CodingKey {
        case isUntrimmed, isContaminated, sufferedWaterIngress, comment
    }
}
