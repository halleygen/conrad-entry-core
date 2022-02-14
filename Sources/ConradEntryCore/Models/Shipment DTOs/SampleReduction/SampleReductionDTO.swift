//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct SampleReductionDTO: SampleReductionProtocol, APIResponseItem {
    public let id: UUID
    public let samplingCompanyID: Int
    public let location: LocationDTO
    public let siteID: Int
    public let laboratoryID: Int?
    public let reductionPointID: Int
    public let startTime: Date
    public let finishTime: Date
    public let wasScreened: Bool
    public let screenApertureMillimetres: Double?
    public let wasConedAndQuartered: Bool
    public let methodID: Int
    public let gridSizeID: Int?
    public let comments: [String]
    public let createdAt: Date
    public let updatedAt: Date

    public var version: Date { updatedAt }

    public init(id: ID, samplingCompanyID: Int, siteID: Int, laboratoryID: Int?, location: LocationDTO, reductionPointID: Int, startTime: Date, finishTime: Date, wasScreened: Bool, screenApertureMillimetres: Double?, wasConedAndQuartered: Bool, methodID: Int, gridSizeID: Int?, comments: [String], createdAt: Date, updatedAt: Date) {
        self.id = id
        self.samplingCompanyID = samplingCompanyID
        self.siteID = siteID
        self.laboratoryID = laboratoryID
        self.location = location
        self.reductionPointID = reductionPointID
        self.startTime = startTime
        self.finishTime = finishTime
        self.wasScreened = wasScreened
        self.screenApertureMillimetres = screenApertureMillimetres
        self.wasConedAndQuartered = wasConedAndQuartered
        self.methodID = methodID
        self.gridSizeID = gridSizeID
        self.comments = comments
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public init(_ other: SampleReductionProtocol, id: ID, createdAt: Date, updatedAt: Date) {
        self.init(id: id, samplingCompanyID: other.samplingCompanyID, siteID: other.siteID, laboratoryID: other.laboratoryID, location: other.location, reductionPointID: other.reductionPointID, startTime: other.startTime, finishTime: other.finishTime, wasScreened: other.wasScreened, screenApertureMillimetres: other.screenApertureMillimetres, wasConedAndQuartered: other.wasConedAndQuartered, methodID: other.methodID, gridSizeID: other.gridSizeID, comments: other.comments, createdAt: createdAt, updatedAt: updatedAt)
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case samplingCompanyID
        case siteID
        case laboratoryID
        case location
        case reductionPointID
        case startTime
        case finishTime
        case wasScreened
        case screenApertureMillimetres
        case wasConedAndQuartered
        case methodID
        case gridSizeID
        case comments
        case createdAt
        case updatedAt
    }
}
