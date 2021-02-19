//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct SampleReductionDTO: Codable, Hashable, Identifiable {
    public let id: UUID?
    public let samplingCompanyID: Int
    public let location: LocationDTO
    public let siteID: Int
    public let laboratoryID: Int?
    public let pointID: Int
    public let startTime: Date
    public let finishTime: Date
    public let wasScreened: Bool
    public let screenApertureMillimetres: Double?
    public let wasConedAndQuartered: Bool
    public let methodID: Int
    public let gridSizeID: Int?
    public let comments: [String]

    public init(id: UUID?, samplingCompanyID: Int, siteID: Int, laboratoryID: Int?, location: LocationDTO, pointID: Int, startTime: Date, finishTime: Date, wasScreened: Bool, screenApertureMillimetres: Double?, wasConedAndQuartered: Bool, methodID: Int, gridSizeID: Int?, comments: [String]) {
        self.id = id
        self.samplingCompanyID = samplingCompanyID
        self.siteID = siteID
        self.laboratoryID = laboratoryID
        self.location = location
        self.pointID = pointID
        self.startTime = startTime
        self.finishTime = finishTime
        self.wasScreened = wasScreened
        self.screenApertureMillimetres = screenApertureMillimetres
        self.wasConedAndQuartered = wasConedAndQuartered
        self.methodID = methodID
        self.gridSizeID = gridSizeID
        self.comments = comments
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case samplingCompanyID
        case siteID
        case laboratoryID
        case location
        case pointID
        case startTime
        case finishTime
        case wasScreened
        case screenApertureMillimetres
        case wasConedAndQuartered
        case methodID
        case gridSizeID
        case comments
    }
}
