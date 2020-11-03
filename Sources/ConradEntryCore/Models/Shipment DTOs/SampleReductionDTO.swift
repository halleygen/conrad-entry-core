//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct SampleReductionDTO: Codable {
    public let id: UUID?
    public let locationID: UUID
    public let wasScreened: Bool
    public let screenApertureMillimetres: Double?
    public let methodID: UUID
    public let gridSizeID: UUID
    public let comments: String

    public init(id: UUID?, locationID: UUID, wasScreened: Bool, screenApertureMillimetres: Double?, methodID: UUID, gridSizeID: UUID, comments: String) {
        self.id = id
        self.locationID = locationID
        self.wasScreened = wasScreened
        self.screenApertureMillimetres = screenApertureMillimetres
        self.methodID = methodID
        self.gridSizeID = gridSizeID
        self.comments = comments
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case locationID
        case wasScreened
        case screenApertureMillimetres
        case methodID
        case gridSizeID
        case comments
    }
}
