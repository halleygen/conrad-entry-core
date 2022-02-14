//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct MoistureDeterminationDTO: MoistureDeterminationProtocol, APIResponseItem {
    public let id: UUID
    public let moistureDeterminationCompanyID: Int
    public let siteID: Int
    public let location: LocationDTO
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
    public let createdAt: Date
    public let updatedAt: Date

    public var version: Date { updatedAt }

    public init(id: ID, moistureDeterminationCompanyID: Int, siteID: Int, location: LocationDTO, lotSampleTrayWeightKilograms: Double, ovenOnTime: Date, ovenOffTime: Date, ovenTemperatureCelsius: Int, checkedForConstantWeight: Bool, constantWeightDuration: TimeInterval?, numberOfWeighBacks: Int?, resultsWaitTimeDays: Int, transparencyID: Int, comments: [String], createdAt: Date, updatedAt: Date) {
        self.id = id
        self.moistureDeterminationCompanyID = moistureDeterminationCompanyID
        self.siteID = siteID
        self.location = location
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
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public init(_ other: MoistureDeterminationProtocol, id: ID, createdAt: Date, updatedAt: Date) {
        self.init(id: id, moistureDeterminationCompanyID: other.moistureDeterminationCompanyID, siteID: other.siteID, location: other.location, lotSampleTrayWeightKilograms: other.lotSampleTrayWeightKilograms, ovenOnTime: other.ovenOnTime, ovenOffTime: other.ovenOffTime, ovenTemperatureCelsius: other.ovenTemperatureCelsius, checkedForConstantWeight: other.checkedForConstantWeight, constantWeightDuration: other.constantWeightDuration, numberOfWeighBacks: other.numberOfWeighBacks, resultsWaitTimeDays: other.resultsWaitTimeDays, transparencyID: other.transparencyID, comments: other.comments, createdAt: createdAt, updatedAt: updatedAt)
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
        case checkedForConstantWeight
        case constantWeightDuration
        case numberOfWeighBacks
        case resultsWaitTimeDays
        case transparencyID
        case comments
        case createdAt
        case updatedAt
    }
}
