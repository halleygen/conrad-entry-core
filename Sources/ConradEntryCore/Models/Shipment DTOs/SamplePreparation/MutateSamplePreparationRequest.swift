//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct MutateSamplePreparationRequest: SamplePreparationProtocol, ShipmentChildMutationRequest {
    public typealias ID = UUID?

    public let id: ID
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

    public init(id: ID = nil, preparationCompanyID: Int, siteID: Int, location: LocationDTO, startTime: Date, finishTime: Date, standardsID: Int, wasScreened: Bool, screenApertureID: Int?, oversizePulverizedSeparately: Bool?, sampleChargeWeightGrams: Int, pulverizerID: Int, pulverizingDurationSeconds: TimeInterval, divisionMethodID: Int, rsdNumberOfSegments: Int?, incrementISOScoopUsed: Bool?, incrementBackingPlateUsed: Bool?, incrementDividedToExtinction: Bool?, riffleApertureMillimetres: Int?, numberOfSets: Int, transparencyID: Int, comments: [String]) {
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
    }

    public init(_ other: SamplePreparationProtocol, id: ID = nil) {
        self.init(id: id, preparationCompanyID: other.preparationCompanyID, siteID: other.siteID, location: other.location, startTime: other.startTime, finishTime: other.finishTime, standardsID: other.standardsID, wasScreened: other.wasScreened, screenApertureID: other.screenApertureID, oversizePulverizedSeparately: other.oversizePulverizedSeparately, sampleChargeWeightGrams: other.sampleChargeWeightGrams, pulverizerID: other.pulverizerID, pulverizingDurationSeconds: other.pulverizingDurationSeconds, divisionMethodID: other.divisionMethodID, rsdNumberOfSegments: other.rsdNumberOfSegments, incrementISOScoopUsed: other.incrementISOScoopUsed, incrementBackingPlateUsed: other.incrementBackingPlateUsed, incrementDividedToExtinction: other.incrementDividedToExtinction, riffleApertureMillimetres: other.riffleApertureMillimetres, numberOfSets: other.numberOfSets, transparencyID: other.transparencyID, comments: other.comments)
    }

    public func eraseToAnyMutationRequest() -> AnyShipmentChildMutationRequest {
        .samplePreparation(request: self)
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
    }
}
