//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct DischargeDTO: Codable, Hashable, Identifiable {
    public let id: UUID?
    public let berthName: String
    public let berthLocation: LocationDTO
    public let dischargeGearID: Int
    public let methodID: Int
    public let cargoCondition: CargoConditionDTO
    public let weatherConditionsID: Int
    public let startTime: Date
    public let finishTimeLastGrab: Date
    public let finishTimeCleanup: Date
    public let dischargeRateTonnesPerHour: Double
    public let saveAllTarpaulinsUsed: Bool
    public let holdsCleaned: Bool
    public let wharfCleaned: Bool
    public let comments: [String]

    @inlinable public var finishTimeForCalculations: Date { finishTimeCleanup }

    public var interval: DateInterval {
        .init(start: startTime, end: finishTimeCleanup)
    }

    public init(id: UUID?, berthName: String, berthLocation: LocationDTO, dischargeGearID: Int, methodID: Int, cargoCondition: CargoConditionDTO, weatherConditionsID: Int, startTime: Date, finishTimeLastGrab: Date, finishTimeCleanup: Date, dischargeRateTonnesPerHour: Double, saveAllTarpaulinsUsed: Bool, holdsCleaned: Bool, wharfCleaned: Bool, comments: [String]) {
        self.id = id
        self.berthName = berthName
        self.berthLocation = berthLocation
        self.dischargeGearID = dischargeGearID
        self.methodID = methodID
        self.cargoCondition = cargoCondition
        self.weatherConditionsID = weatherConditionsID
        self.startTime = startTime
        self.finishTimeLastGrab = finishTimeLastGrab
        self.finishTimeCleanup = finishTimeCleanup
        self.dischargeRateTonnesPerHour = dischargeRateTonnesPerHour
        self.saveAllTarpaulinsUsed = saveAllTarpaulinsUsed
        self.holdsCleaned = holdsCleaned
        self.wharfCleaned = wharfCleaned
        self.comments = comments
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case berthName
        case berthLocation
        case dischargeGearID
        case methodID
        case cargoCondition
        case weatherConditionsID
        case startTime
        case finishTimeLastGrab
        case finishTimeCleanup
        case dischargeRateTonnesPerHour
        case saveAllTarpaulinsUsed
        case holdsCleaned
        case wharfCleaned
        case comments
    }
}
