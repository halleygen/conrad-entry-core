//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct MoistureDeterminationDTO: Codable, Hashable, Identifiable {
    public let id: UUID?
    public let moistureDeterminationCompanyID: Int
    public let locationID: Int
    public let lotSampleWeightKilograms: Double
    public let ovenOnTime: Date
    public let ovenOffTime: Date
    public let hoursInOven: Double
    public let ovenTemperatureCelsius: Int
    public let checkedForConstantWeight: Bool
    public let resultsWaitTimeDays: Int
    public let transparencyID: Int
    public let comments: String

    public init(id: UUID?, moistureDeterminationCompanyID: Int, locationID: Int, lotSampleWeightKilograms: Double, ovenOnTime: Date, ovenOffTime: Date, hoursInOven: Double, ovenTemperatureCelsius: Int, checkedForConstantWeight: Bool, resultsWaitTimeDays: Int, transparencyID: Int, comments: String) {
        self.id = id
        self.moistureDeterminationCompanyID = moistureDeterminationCompanyID
        self.locationID = locationID
        self.lotSampleWeightKilograms = lotSampleWeightKilograms
        self.ovenOnTime = ovenOnTime
        self.ovenOffTime = ovenOffTime
        self.hoursInOven = hoursInOven
        self.ovenTemperatureCelsius = ovenTemperatureCelsius
        self.checkedForConstantWeight = checkedForConstantWeight
        self.resultsWaitTimeDays = resultsWaitTimeDays
        self.transparencyID = transparencyID
        self.comments = comments
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case moistureDeterminationCompanyID
        case locationID
        case lotSampleWeightKilograms
        case ovenOnTime
        case ovenOffTime
        case hoursInOven
        case ovenTemperatureCelsius
        case checkedForConstantWeight
        case resultsWaitTimeDays
        case transparencyID
        case comments
    }
}
