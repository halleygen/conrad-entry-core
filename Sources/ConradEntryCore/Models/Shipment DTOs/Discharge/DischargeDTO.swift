//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct DischargeDTO: DischargeProtocol, APIResponseItem {
    public let id: UUID
    public let berthName: String
    public let berthLocation: LocationDTO
    public let gearID: Int
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
    public let createdAt: Date
    public let updatedAt: Date

    public var version: Date { updatedAt }

    public init(id: ID, berthName: String, berthLocation: LocationDTO, gearID: Int, methodID: Int, cargoCondition: CargoConditionDTO, weatherConditionsID: Int, startTime: Date, finishTimeLastGrab: Date, finishTimeCleanup: Date, dischargeRateTonnesPerHour: Double, saveAllTarpaulinsUsed: Bool, holdsCleaned: Bool, wharfCleaned: Bool, comments: [String], createdAt: Date, updatedAt: Date) {
        self.id = id
        self.berthName = berthName
        self.berthLocation = berthLocation
        self.gearID = gearID
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
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public init(_ other: DischargeProtocol, id: ID, createdAt: Date, updatedAt: Date) {
        self.init(id: id, berthName: other.berthName, berthLocation: other.berthLocation, gearID: other.gearID, methodID: other.methodID, cargoCondition: other.cargoCondition, weatherConditionsID: other.weatherConditionsID, startTime: other.startTime, finishTimeLastGrab: other.finishTimeLastGrab, finishTimeCleanup: other.finishTimeCleanup, dischargeRateTonnesPerHour: other.dischargeRateTonnesPerHour, saveAllTarpaulinsUsed: other.saveAllTarpaulinsUsed, holdsCleaned: other.holdsCleaned, wharfCleaned: other.wharfCleaned, comments: other.comments, createdAt: createdAt, updatedAt: updatedAt)
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case berthName
        case berthLocation
        case gearID
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
        case createdAt
        case updatedAt
    }
}
