//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct QualityLotSamplePreparationDTO: Codable, Hashable, Identifiable, VersionedDTO {
    public let id: UUID?
    public let preparationCompanyID: Int
    public let siteID: Int
    public let location: LocationDTO
    public let startTime: Date
    public let finishTime: Date
    public let standardsID: Int
    public let wasScreened: Bool
    public let screenApertureID: Int?
    public let oversizePulverizedSeparately: Bool?
    public let sampleChargeWeightGrams: Int
    public let pulverizerID: Int
    public let pulverizingDurationSeconds: TimeInterval
    public let divisionMethodID: Int
    public let rsdNumberOfSegments: Int?
    public let incrementISOScoopUsed: Bool?
    public let incrementBackingPlateUsed: Bool?
    public let incrementDividedToExtinction: Bool?
    public let riffleApertureMillimetres: Int?
    public let numberOfSets: Int
    public let transparencyID: Int
    public let comments: [String]
    public let createdAt: Date?
    public let updatedAt: Date?

    public init(id: UUID?, preparationCompanyID: Int, siteID: Int, location: LocationDTO, startTime: Date, finishTime: Date, standardsID: Int, wasScreened: Bool, screenApertureID: Int?, oversizePulverizedSeparately: Bool?, sampleChargeWeightGrams: Int, pulverizerID: Int, pulverizingDurationSeconds: TimeInterval, divisionMethodID: Int, rsdNumberOfSegments: Int?, incrementISOScoopUsed: Bool?, incrementBackingPlateUsed: Bool?, incrementDividedToExtinction: Bool?, riffleApertureMillimetres: Int?, numberOfSets: Int, transparencyID: Int, comments: [String], createdAt: Date?, updatedAt: Date?) {
        self.id = id
        self.preparationCompanyID = preparationCompanyID
        self.siteID = siteID
        self.location = location
        self.startTime = startTime
        self.finishTime = finishTime
        self.standardsID = standardsID
        self.wasScreened = wasScreened
        self.screenApertureID = screenApertureID
        self.oversizePulverizedSeparately = oversizePulverizedSeparately
        self.sampleChargeWeightGrams = sampleChargeWeightGrams
        self.pulverizerID = pulverizerID
        self.pulverizingDurationSeconds = pulverizingDurationSeconds
        self.divisionMethodID = divisionMethodID
        self.rsdNumberOfSegments = rsdNumberOfSegments
        self.incrementISOScoopUsed = incrementISOScoopUsed
        self.incrementBackingPlateUsed = incrementBackingPlateUsed
        self.incrementDividedToExtinction = incrementDividedToExtinction
        self.riffleApertureMillimetres = riffleApertureMillimetres
        self.numberOfSets = numberOfSets
        self.transparencyID = transparencyID
        self.comments = comments
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case preparationCompanyID
        case siteID
        case location
        case startTime
        case finishTime
        case standardsID
        case wasScreened
        case screenApertureID
        case oversizePulverizedSeparately
        case sampleChargeWeightGrams
        case pulverizerID
        case pulverizingDurationSeconds
        case divisionMethodID
        case rsdNumberOfSegments
        case incrementISOScoopUsed
        case incrementBackingPlateUsed
        case incrementDividedToExtinction
        case riffleApertureMillimetres
        case numberOfSets
        case transparencyID
        case comments
        case createdAt
        case updatedAt
    }
}
