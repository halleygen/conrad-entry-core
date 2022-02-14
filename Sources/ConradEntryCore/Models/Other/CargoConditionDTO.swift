//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct CargoConditionDTO: Codable, Hashable {
    public let isTrimmed: Bool
    public let isContaminated: Bool
    public let sufferedWaterIngress: Bool
    public let comment: String

    public init(isTrimmed: Bool, isContaminated: Bool, sufferedWaterIngress: Bool, comment: String) {
        self.isTrimmed = isTrimmed
        self.isContaminated = isContaminated
        self.sufferedWaterIngress = sufferedWaterIngress
        self.comment = comment
    }

    public enum CodingKeys: String, CodingKey {
        case isTrimmed, isContaminated, sufferedWaterIngress, comment
    }
}
