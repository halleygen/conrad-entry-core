//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct MoistureDeterminationDTO: Codable {
    public let id: UUID?
    public let moistureDeterminationCompanyID: UUID
    public let locationID: UUID
    public let lotSampleWeightKilograms: Double
    public let dryingStartTime: Date?
    public let dryingFinishTime: Date?
    public let dryingHoursInOven: TimeInterval?
    public let checkedForConstantWeight: Bool
    public let resultsWaitTimeDays: Int
    public let transparencyID: UUID
    public let comments: String

    public init(id: UUID?, moistureDeterminationCompanyID: UUID, locationID: UUID, lotSampleWeightKilograms: Double, dryingStartTime: Date?, dryingFinishTime: Date?, dryingHoursInOven: TimeInterval?, checkedForConstantWeight: Bool, resultsWaitTimeDays: Int, transparencyID: UUID, comments: String) {
        self.id = id
        self.moistureDeterminationCompanyID = moistureDeterminationCompanyID
        self.locationID = locationID
        self.lotSampleWeightKilograms = lotSampleWeightKilograms
        self.dryingStartTime = dryingStartTime
        self.dryingFinishTime = dryingFinishTime
        self.dryingHoursInOven = dryingHoursInOven
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
        case dryingStartTime
        case dryingFinishTime
        case dryingHoursInOven
        case checkedForConstantWeight
        case resultsWaitTimeDays
        case transparencyID
        case comments
    }
}
