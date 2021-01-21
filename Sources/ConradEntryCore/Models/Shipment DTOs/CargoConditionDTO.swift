//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct CargoConditionDTO: Codable, Hashable {
    public let isUntrimmed: Bool
    public let isContaminated: Bool
    public let sufferedWaterIngress: Bool
    public let comments: String

    public init(isUntrimmed: Bool, isContaminated: Bool, sufferedWaterIngress: Bool, comments: String) {
        self.isUntrimmed = isUntrimmed
        self.isContaminated = isContaminated
        self.sufferedWaterIngress = sufferedWaterIngress
        self.comments = comments
    }

    public enum CodingKeys: String, CodingKey {
        case isUntrimmed, isContaminated, sufferedWaterIngress, comments
    }
}
