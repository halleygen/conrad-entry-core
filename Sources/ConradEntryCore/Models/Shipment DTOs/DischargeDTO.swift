//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct DischargeDTO: Codable, Hashable, Identifiable {
    public let id: UUID?
    public let methodID: Int
    public let cargoConditionID: Int
    public let weatherConditionsID: Int
    public let startTime: Date
    public let finishTimeLastGrab: Date
    public let finishTimeCleanup: Date
    public let duration: TimeInterval
    public let dischargeRate: Double
    public let saveAllTarpaulinsUsed: Bool
    public let holdsCleaned: Bool
    public let wharfCleaned: Bool
    public let comments: String

    public init(id: UUID?, methodID: Int, cargoConditionID: Int, weatherConditionsID: Int, startTime: Date, finishTimeLastGrab: Date, finishTimeCleanup: Date, duration: TimeInterval, dischargeRate: Double, saveAllTarpaulinsUsed: Bool, holdsCleaned: Bool, wharfCleaned: Bool, comments: String) {
        self.id = id
        self.methodID = methodID
        self.cargoConditionID = cargoConditionID
        self.weatherConditionsID = weatherConditionsID
        self.startTime = startTime
        self.finishTimeLastGrab = finishTimeLastGrab
        self.finishTimeCleanup = finishTimeCleanup
        self.duration = duration
        self.dischargeRate = dischargeRate
        self.saveAllTarpaulinsUsed = saveAllTarpaulinsUsed
        self.holdsCleaned = holdsCleaned
        self.wharfCleaned = wharfCleaned
        self.comments = comments
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case methodID
        case cargoConditionID
        case weatherConditionsID
        case startTime
        case finishTimeLastGrab
        case finishTimeCleanup
        case duration
        case dischargeRate
        case saveAllTarpaulinsUsed
        case holdsCleaned
        case wharfCleaned
        case comments
    }
}
