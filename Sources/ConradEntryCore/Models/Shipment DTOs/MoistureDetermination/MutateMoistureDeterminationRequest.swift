//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct MutateMoistureDeterminationRequest: MoistureDeterminationProtocol, Codable {
    public typealias ID = UUID?

    public let id: ID
    public let moistureDeterminationCompanyID: Int
    public let siteID: Int
    public let location: LocationDTO
    public let lotSampleTrayWeightKilograms: Double
    public let ovenOnTime: Date
    public let ovenOffTime: Date
    public let ovenTemperatureCelsius: Int
    public let constantWeightCheck: ConstantWeightCheck?
    public let resultsWaitTimeDays: Int
    public let transparencyID: Int
    public let comments: [String]

    public init(id: ID = nil, moistureDeterminationCompanyID: Int, siteID: Int, location: LocationDTO, lotSampleTrayWeightKilograms: Double, ovenOnTime: Date, ovenOffTime: Date, ovenTemperatureCelsius: Int, constantWeightCheck: ConstantWeightCheck?, resultsWaitTimeDays: Int, transparencyID: Int, comments: [String]) {
        self.id = id
        self.moistureDeterminationCompanyID = moistureDeterminationCompanyID
        self.siteID = siteID
        self.location = location
        self.lotSampleTrayWeightKilograms = lotSampleTrayWeightKilograms
        self.ovenOnTime = ovenOnTime
        self.ovenOffTime = ovenOffTime
        self.ovenTemperatureCelsius = ovenTemperatureCelsius
        self.constantWeightCheck = constantWeightCheck
        self.resultsWaitTimeDays = resultsWaitTimeDays
        self.transparencyID = transparencyID
        self.comments = comments
    }

    public init(_ other: MoistureDeterminationProtocol, id: ID = nil) {
        self.init(id: id, moistureDeterminationCompanyID: other.moistureDeterminationCompanyID, siteID: other.siteID, location: other.location, lotSampleTrayWeightKilograms: other.lotSampleTrayWeightKilograms, ovenOnTime: other.ovenOnTime, ovenOffTime: other.ovenOffTime, ovenTemperatureCelsius: other.ovenTemperatureCelsius, constantWeightCheck: other.constantWeightCheck, resultsWaitTimeDays: other.resultsWaitTimeDays, transparencyID: other.transparencyID, comments: other.comments)
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case moistureDeterminationCompanyID
        case siteID
        case location
        case lotSampleTrayWeightKilograms
        case ovenOnTime
        case ovenOffTime
        case ovenTemperatureCelsius
        case constantWeightCheck
        case resultsWaitTimeDays
        case transparencyID
        case comments
    }
}
