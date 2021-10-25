//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct MutateDischargeRequest: DischargeProtocol, Codable {
    public typealias ID = UUID?

    public let id: ID
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

    public init(id: ID = nil, berthName: String, berthLocation: LocationDTO, gearID: Int, methodID: Int, cargoCondition: CargoConditionDTO, weatherConditionsID: Int, startTime: Date, finishTimeLastGrab: Date, finishTimeCleanup: Date, dischargeRateTonnesPerHour: Double, saveAllTarpaulinsUsed: Bool, holdsCleaned: Bool, wharfCleaned: Bool, comments: [String]) {
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
    }

    public init(_ other: DischargeProtocol, id: ID = nil) {
        self.init(id: id, berthName: other.berthName, berthLocation: other.berthLocation, gearID: other.gearID, methodID: other.methodID, cargoCondition: other.cargoCondition, weatherConditionsID: other.weatherConditionsID, startTime: other.startTime, finishTimeLastGrab: other.finishTimeLastGrab, finishTimeCleanup: other.finishTimeCleanup, dischargeRateTonnesPerHour: other.dischargeRateTonnesPerHour, saveAllTarpaulinsUsed: other.saveAllTarpaulinsUsed, holdsCleaned: other.holdsCleaned, wharfCleaned: other.wharfCleaned, comments: other.comments)
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
    }
}
