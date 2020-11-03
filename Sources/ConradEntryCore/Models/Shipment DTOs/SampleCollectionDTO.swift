//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct SampleCollectionDTO: Codable {
    public let id: UUID?
    public let samplingCompanyID: UUID
    public let locationID: UUID
    public let samplingPointID: UUID
    public let methodID: UUID
    public let sampleIncrementsWetTonnes: Double
    public let typicalSampleWeightKilograms: Double
    public let numberOfTrucksPerBag: Int?
    public let lotSizeWetTonnes: Int
    public let sublotSizeWetTonnes: Int?
    public let comments: String

    public init(id: UUID?, samplingCompanyID: UUID, locationID: UUID, samplingPointID: UUID, methodID: UUID, sampleIncrementsWetTonnes: Double, typicalSampleWeightKilograms: Double, numberOfTrucksPerBag: Int?, lotSizeWetTonnes: Int, sublotSizeWetTonnes: Int?, comments: String) {
        self.id = id
        self.samplingCompanyID = samplingCompanyID
        self.locationID = locationID
        self.samplingPointID = samplingPointID
        self.methodID = methodID
        self.sampleIncrementsWetTonnes = sampleIncrementsWetTonnes
        self.typicalSampleWeightKilograms = typicalSampleWeightKilograms
        self.numberOfTrucksPerBag = numberOfTrucksPerBag
        self.lotSizeWetTonnes = lotSizeWetTonnes
        self.sublotSizeWetTonnes = sublotSizeWetTonnes
        self.comments = comments
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case samplingCompanyID
        case locationID
        case samplingPointID
        case methodID
        case sampleIncrementsWetTonnes
        case typicalSampleWeightKilograms
        case numberOfTrucksPerBag
        case lotSizeWetTonnes
        case sublotSizeWetTonnes
        case comments
    }
}
