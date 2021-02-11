//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct SampleReductionDTO: Codable, Hashable, Identifiable {
    public let id: UUID?
    public let locationID: Int
    public let wasScreened: Bool
    public let screenApertureMillimetres: Double?
    public let methodID: Int
    public let gridSizeID: Int
    public let comments: [String]

    public init(id: UUID?, locationID: Int, wasScreened: Bool, screenApertureMillimetres: Double?, methodID: Int, gridSizeID: Int, comments: [String]) {
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
