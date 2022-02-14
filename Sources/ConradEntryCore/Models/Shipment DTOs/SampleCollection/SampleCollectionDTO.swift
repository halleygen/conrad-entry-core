//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct SampleCollectionDTO: SampleCollectionProtocol, APIResponseItem {
    public let id: UUID
    public let samplingCompanyID: Int
    public let siteID: Int
    public let location: LocationDTO
    public let samplingPointID: Int
    public let startTime: Date
    public let finishTime: Date
    public let methodID: Int
    public let sampleIncrementsWetTonnes: Double
    public let typicalSampleWeightKilograms: Double
    public let numberOfTrucksPerBag: Int?
    public let lotSizeWetTonnes: Int
    public let sublotSizeWetTonnes: Int?
    public let numberOfLots: Int
    public let comments: [String]
    public let createdAt: Date
    public let updatedAt: Date

    public var version: Date { updatedAt }

    public init(id: ID, samplingCompanyID: Int, siteID: Int, location: LocationDTO, samplingPointID: Int, startTime: Date, finishTime: Date, methodID: Int, sampleIncrementsWetTonnes: Double, typicalSampleWeightKilograms: Double, numberOfTrucksPerBag: Int?, lotSizeWetTonnes: Int, sublotSizeWetTonnes: Int?, numberOfLots: Int, comments: [String], createdAt: Date, updatedAt: Date) {
        self.id = id
        self.samplingCompanyID = samplingCompanyID
        self.siteID = siteID
        self.location = location
        self.samplingPointID = samplingPointID
        self.methodID = methodID
        self.startTime = startTime
        self.finishTime = finishTime
        self.sampleIncrementsWetTonnes = sampleIncrementsWetTonnes
        self.typicalSampleWeightKilograms = typicalSampleWeightKilograms
        self.numberOfTrucksPerBag = numberOfTrucksPerBag
        self.lotSizeWetTonnes = lotSizeWetTonnes
        self.sublotSizeWetTonnes = sublotSizeWetTonnes
        self.numberOfLots = numberOfLots
        self.comments = comments
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public init(_ other: SampleCollectionProtocol, id: ID, createdAt: Date, updatedAt: Date) {
        self.init(id: id, samplingCompanyID: other.samplingCompanyID, siteID: other.siteID, location: other.location, samplingPointID: other.samplingPointID, startTime: other.startTime, finishTime: other.finishTime, methodID: other.methodID, sampleIncrementsWetTonnes: other.sampleIncrementsWetTonnes, typicalSampleWeightKilograms: other.typicalSampleWeightKilograms, numberOfTrucksPerBag: other.numberOfTrucksPerBag, lotSizeWetTonnes: other.lotSizeWetTonnes, sublotSizeWetTonnes: other.sublotSizeWetTonnes, numberOfLots: other.numberOfLots, comments: other.comments, createdAt: createdAt, updatedAt: updatedAt)
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case samplingCompanyID
        case siteID
        case location
        case samplingPointID
        case startTime
        case finishTime
        case methodID
        case sampleIncrementsWetTonnes
        case typicalSampleWeightKilograms
        case numberOfTrucksPerBag
        case lotSizeWetTonnes
        case sublotSizeWetTonnes
        case numberOfLots
        case comments
        case createdAt
        case updatedAt
    }
}
