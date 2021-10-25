//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct MutateMoistureDeterminationRequest: MoistureDeterminationProtocol, Codable {
    public typealias ID = UUID?

    public let id: ID
    public let moistureDeterminationCompanyID: Int
    public let siteID: Int
    public let locationDTO: LocationDTO
    public let lotSampleTrayWeightKilograms: Double
    public let ovenOnTime: Date
    public let ovenOffTime: Date
    public let ovenTemperatureCelsius: Int
    public let checkedForConstantWeight: Bool
    public let constantWeightDuration: TimeInterval?
    public let numberOfWeighBacks: Int?
    public let resultsWaitTimeDays: Int
    public let transparencyID: Int
    public let comments: [String]

    public init(id: ID = nil, moistureDeterminationCompanyID: Int, siteID: Int, locationDTO: LocationDTO, lotSampleTrayWeightKilograms: Double, ovenOnTime: Date, ovenOffTime: Date, ovenTemperatureCelsius: Int, checkedForConstantWeight: Bool, constantWeightDuration: TimeInterval?, numberOfWeighBacks: Int?, resultsWaitTimeDays: Int, transparencyID: Int, comments: [String]) {
        self.id = id
        self.moistureDeterminationCompanyID = moistureDeterminationCompanyID
        self.siteID = siteID
        self.locationDTO = locationDTO
        self.lotSampleTrayWeightKilograms = lotSampleTrayWeightKilograms
        self.ovenOnTime = ovenOnTime
        self.ovenOffTime = ovenOffTime
        self.ovenTemperatureCelsius = ovenTemperatureCelsius
        self.checkedForConstantWeight = checkedForConstantWeight
        self.constantWeightDuration = constantWeightDuration
        self.numberOfWeighBacks = numberOfWeighBacks
        self.resultsWaitTimeDays = resultsWaitTimeDays
        self.transparencyID = transparencyID
        self.comments = comments
    }

    public init(_ other: MoistureDeterminationProtocol, id: ID = nil) {
        self.init(id: id, moistureDeterminationCompanyID: other.moistureDeterminationCompanyID, siteID: other.siteID, locationDTO: other.locationDTO, lotSampleTrayWeightKilograms: other.lotSampleTrayWeightKilograms, ovenOnTime: other.ovenOnTime, ovenOffTime: other.ovenOffTime, ovenTemperatureCelsius: other.ovenTemperatureCelsius, checkedForConstantWeight: other.checkedForConstantWeight, constantWeightDuration: other.constantWeightDuration, numberOfWeighBacks: other.numberOfWeighBacks, resultsWaitTimeDays: other.resultsWaitTimeDays, transparencyID: other.transparencyID, comments: other.comments)
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case moistureDeterminationCompanyID
        case siteID
        case locationDTO = "location"
        case lotSampleTrayWeightKilograms
        case ovenOnTime
        case ovenOffTime
        case ovenTemperatureCelsius
        case checkedForConstantWeight
        case constantWeightDuration
        case numberOfWeighBacks
        case resultsWaitTimeDays
        case transparencyID
        case comments
    }
}
