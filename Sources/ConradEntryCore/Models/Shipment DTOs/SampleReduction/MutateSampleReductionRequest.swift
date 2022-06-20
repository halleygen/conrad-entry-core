//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct MutateSampleReductionRequest: SampleReductionProtocol, ShipmentChildMutationRequest {
    public typealias ID = UUID?

    public let id: ID
    public let samplingCompanyID: Int
    public let location: LocationDTO
    public let siteID: Int
    public let laboratoryID: Int?
    public let reductionPointID: Int
    public let startTime: Date
    public let finishTime: Date
    public let screenApertureMillimetres: Double?
    public let wasConedAndQuartered: Bool
    public let methodID: Int
    public let gridSizeID: Int?
    public let comments: [String]

    public init(id: ID = nil, samplingCompanyID: Int, siteID: Int, laboratoryID: Int?, location: LocationDTO, reductionPointID: Int, startTime: Date, finishTime: Date, screenApertureMillimetres: Double?, wasConedAndQuartered: Bool, methodID: Int, gridSizeID: Int?, comments: [String]) {
        self.id = id
        self.samplingCompanyID = samplingCompanyID
        self.siteID = siteID
        self.laboratoryID = laboratoryID
        self.location = location
        self.reductionPointID = reductionPointID
        self.startTime = startTime
        self.finishTime = finishTime
        self.screenApertureMillimetres = screenApertureMillimetres
        self.wasConedAndQuartered = wasConedAndQuartered
        self.methodID = methodID
        self.gridSizeID = gridSizeID
        self.comments = comments
    }

    public init(_ other: SampleReductionProtocol, id: ID = nil) {
        self.init(id: id, samplingCompanyID: other.samplingCompanyID, siteID: other.siteID, laboratoryID: other.laboratoryID, location: other.location, reductionPointID: other.reductionPointID, startTime: other.startTime, finishTime: other.finishTime, screenApertureMillimetres: other.screenApertureMillimetres, wasConedAndQuartered: other.wasConedAndQuartered, methodID: other.methodID, gridSizeID: other.gridSizeID, comments: other.comments)
    }

    public func eraseToAnyMutationRequest() -> AnyShipmentChildMutationRequest {
        .sampleReduction(request: self)
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
        case screenApertureMillimetres
        case wasConedAndQuartered
        case methodID
        case gridSizeID
        case comments
    }
}
