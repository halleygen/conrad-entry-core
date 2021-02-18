//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct SampleCollectionDTO: Codable, Hashable, Identifiable {
    public let id: UUID?
    public let samplingCompanyID: Int
    public let siteID: Int
    public let location: Location
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

    public init(id: UUID?, samplingCompanyID: Int, siteID: Int, location: Location, samplingPointID: Int, startTime: Date, finishTime: Date, methodID: Int, sampleIncrementsWetTonnes: Double, typicalSampleWeightKilograms: Double, numberOfTrucksPerBag: Int?, lotSizeWetTonnes: Int, sublotSizeWetTonnes: Int?, numberOfLots: Int, comments: [String]) {
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
    }
}
