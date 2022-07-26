//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public protocol PartialMergable {
    static func empty() -> Self
    mutating func merge(from other: Self)
}

public protocol MutationRequest {
    init(keyAndValues: [String: Any])
}

// MARK: - BillOfLading

// MARK: Protocol

public protocol BillOfLadingProperties {
    var loadPortID: Int { get }
    var vesselHolds: Set<Int> { get }
    var weighingMethodID: Int { get }
    var wetMetricTonnes: Double { get }
    var moisturePercentage: Double { get }
    var dryMetricTonnes: Double { get }
}

public protocol BillOfLadingPartialProperties {
    var loadPortID: Int? { get }
    var vesselHolds: Set<Int>? { get }
    var weighingMethodID: Int? { get }
    var wetMetricTonnes: Double? { get }
    var moisturePercentage: Double? { get }
    var dryMetricTonnes: Double? { get }
}

// MARK: CreationRequest

public struct BillOfLadingCreationRequest: BillOfLadingProperties, Codable, Hashable {
    public var loadPortID: Int
    public var vesselHolds: Set<Int>
    public var weighingMethodID: Int
    public var wetMetricTonnes: Double
    public var moisturePercentage: Double
    public var dryMetricTonnes: Double

    public init(
        loadPortID: Int,
        vesselHolds: Set<Int>,
        weighingMethodID: Int,
        wetMetricTonnes: Double,
        moisturePercentage: Double,
        dryMetricTonnes: Double
    ) {
        self.loadPortID = loadPortID
        self.vesselHolds = vesselHolds
        self.weighingMethodID = weighingMethodID
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
    }

    public init?(mutationRequest: BillOfLadingMutationRequest) {
        guard
            let loadPortID = mutationRequest.loadPortID,
            let vesselHolds = mutationRequest.vesselHolds,
            let weighingMethodID = mutationRequest.weighingMethodID,
            let wetMetricTonnes = mutationRequest.wetMetricTonnes,
            let moisturePercentage = mutationRequest.moisturePercentage,
            let dryMetricTonnes = mutationRequest.dryMetricTonnes
        else {
            return nil
        }

        self.loadPortID = loadPortID
        self.vesselHolds = vesselHolds
        self.weighingMethodID = weighingMethodID
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
    }
}

// MARK: MutationRequest

public struct BillOfLadingMutationRequest: BillOfLadingPartialProperties, PartialMergable, MutationRequest, Codable, Hashable {
    public var loadPortID: Int?
    public var vesselHolds: Set<Int>?
    public var weighingMethodID: Int?
    public var wetMetricTonnes: Double?
    public var moisturePercentage: Double?
    public var dryMetricTonnes: Double?

    public init(
        loadPortID: Int? = nil,
        vesselHolds: Set<Int>? = nil,
        weighingMethodID: Int? = nil,
        wetMetricTonnes: Double? = nil,
        moisturePercentage: Double? = nil,
        dryMetricTonnes: Double? = nil
    ) {
        self.loadPortID = loadPortID
        self.vesselHolds = vesselHolds
        self.weighingMethodID = weighingMethodID
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
    }

    public init(keyAndValues: [String: Any]) {
        if let loadPortID = keyAndValues["loadPortID"] as? Int {
            self.loadPortID = loadPortID
        }
        if let vesselHolds = keyAndValues["vesselHolds"] as? Set<Int> {
            self.vesselHolds = vesselHolds
        }
        if let weighingMethodID = keyAndValues["weighingMethodID"] as? Int {
            self.weighingMethodID = weighingMethodID
        }
        if let wetMetricTonnes = keyAndValues["wetMetricTonnes"] as? Double {
            self.wetMetricTonnes = wetMetricTonnes
        }
        if let moisturePercentage = keyAndValues["moisturePercentage"] as? Double {
            self.moisturePercentage = moisturePercentage
        }
        if let dryMetricTonnes = keyAndValues["dryMetricTonnes"] as? Double {
            self.dryMetricTonnes = dryMetricTonnes
        }
    }

    public static func empty() -> Self { Self() }

    public mutating func merge(from other: Self) {
        if let updatedValue = other.loadPortID {
            loadPortID = updatedValue
        }
        if let updatedValue = other.vesselHolds {
            vesselHolds = updatedValue
        }
        if let updatedValue = other.weighingMethodID {
            weighingMethodID = updatedValue
        }
        if let updatedValue = other.wetMetricTonnes {
            wetMetricTonnes = updatedValue
        }
        if let updatedValue = other.moisturePercentage {
            moisturePercentage = updatedValue
        }
        if let updatedValue = other.dryMetricTonnes {
            dryMetricTonnes = updatedValue
        }
    }
}

// MARK: DTO

public struct BillOfLadingDTO: BillOfLadingProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
    public let loadPortID: Int
    public let vesselHolds: Set<Int>
    public let weighingMethodID: Int
    public let wetMetricTonnes: Double
    public let moisturePercentage: Double
    public let dryMetricTonnes: Double

    public init(
        id: UUID,
        version: Date,
        loadPortID: Int,
        vesselHolds: Set<Int>,
        weighingMethodID: Int,
        wetMetricTonnes: Double,
        moisturePercentage: Double,
        dryMetricTonnes: Double
    ) {
        self.id = id
        self.version = version
        self.loadPortID = loadPortID
        self.vesselHolds = vesselHolds
        self.weighingMethodID = weighingMethodID
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
    }

    public init?(partial: PartialBillOfLadingDTO) {
        guard
            let loadPortID = partial.loadPortID,
            let vesselHolds = partial.vesselHolds,
            let weighingMethodID = partial.weighingMethodID,
            let wetMetricTonnes = partial.wetMetricTonnes,
            let moisturePercentage = partial.moisturePercentage,
            let dryMetricTonnes = partial.dryMetricTonnes
        else {
            return nil
        }

        self.id = partial.id
        self.version = partial.version
        self.loadPortID = loadPortID
        self.vesselHolds = vesselHolds
        self.weighingMethodID = weighingMethodID
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
    }

    public init(
        _ creationRequest: BillOfLadingCreationRequest,
        id: UUID,
        version: Date
    ) {
        self.id = id
        self.version = version
        self.loadPortID = creationRequest.loadPortID
        self.vesselHolds = creationRequest.vesselHolds
        self.weighingMethodID = creationRequest.weighingMethodID
        self.wetMetricTonnes = creationRequest.wetMetricTonnes
        self.moisturePercentage = creationRequest.moisturePercentage
        self.dryMetricTonnes = creationRequest.dryMetricTonnes
    }
}

// MARK: PartialDTO

public struct PartialBillOfLadingDTO: BillOfLadingPartialProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
    public let loadPortID: Int?
    public let vesselHolds: Set<Int>?
    public let weighingMethodID: Int?
    public let wetMetricTonnes: Double?
    public let moisturePercentage: Double?
    public let dryMetricTonnes: Double?

    public init(
        id: UUID,
        version: Date,
        loadPortID: Int? = nil,
        vesselHolds: Set<Int>? = nil,
        weighingMethodID: Int? = nil,
        wetMetricTonnes: Double? = nil,
        moisturePercentage: Double? = nil,
        dryMetricTonnes: Double? = nil
    ) {
        self.id = id
        self.version = version
        self.loadPortID = loadPortID
        self.vesselHolds = vesselHolds
        self.weighingMethodID = weighingMethodID
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
    }

    public init(
        _ other: BillOfLadingMutationRequest,
        id: UUID,
        version: Date
    ) {
        self.id = id
        self.version = version
        self.loadPortID = other.loadPortID
        self.vesselHolds = other.vesselHolds
        self.weighingMethodID = other.weighingMethodID
        self.wetMetricTonnes = other.wetMetricTonnes
        self.moisturePercentage = other.moisturePercentage
        self.dryMetricTonnes = other.dryMetricTonnes
    }
}

// MARK: - Discharge

// MARK: Protocol

public protocol DischargeProperties {
    var berthName: String { get }
    var berthLocation: LocationDTO { get }
    var gearID: Int { get }
    var methodID: Int { get }
    var cargoCondition: CargoConditionDTO { get }
    var weatherConditionsID: Int { get }
    var startTime: Date { get }
    var finishTimeLastGrab: Date { get }
    var finishTimeCleanup: Date { get }
    var dischargeRateTonnesPerHour: Double { get }
    var saveAllTarpaulinsUsed: Bool { get }
    var holdsCleaned: Bool { get }
    var wharfCleaned: Bool { get }
}

public protocol DischargePartialProperties {
    var berthName: String? { get }
    var berthLocation: LocationDTO? { get }
    var gearID: Int? { get }
    var methodID: Int? { get }
    var cargoCondition: CargoConditionDTO? { get }
    var weatherConditionsID: Int? { get }
    var startTime: Date? { get }
    var finishTimeLastGrab: Date? { get }
    var finishTimeCleanup: Date? { get }
    var dischargeRateTonnesPerHour: Double? { get }
    var saveAllTarpaulinsUsed: Bool? { get }
    var holdsCleaned: Bool? { get }
    var wharfCleaned: Bool? { get }
}

// MARK: CreationRequest

public struct DischargeCreationRequest: DischargeProperties, Codable, Hashable {
    public var berthName: String
    public var berthLocation: LocationDTO
    public var gearID: Int
    public var methodID: Int
    public var cargoCondition: CargoConditionDTO
    public var weatherConditionsID: Int
    public var startTime: Date
    public var finishTimeLastGrab: Date
    public var finishTimeCleanup: Date
    public var dischargeRateTonnesPerHour: Double
    public var saveAllTarpaulinsUsed: Bool
    public var holdsCleaned: Bool
    public var wharfCleaned: Bool

    public init(
        berthName: String,
        berthLocation: LocationDTO,
        gearID: Int,
        methodID: Int,
        cargoCondition: CargoConditionDTO,
        weatherConditionsID: Int,
        startTime: Date,
        finishTimeLastGrab: Date,
        finishTimeCleanup: Date,
        dischargeRateTonnesPerHour: Double,
        saveAllTarpaulinsUsed: Bool,
        holdsCleaned: Bool,
        wharfCleaned: Bool
    ) {
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
    }

    public init?(mutationRequest: DischargeMutationRequest) {
        guard
            let berthName = mutationRequest.berthName,
            let berthLocation = mutationRequest.berthLocation,
            let gearID = mutationRequest.gearID,
            let methodID = mutationRequest.methodID,
            let cargoCondition = mutationRequest.cargoCondition,
            let weatherConditionsID = mutationRequest.weatherConditionsID,
            let startTime = mutationRequest.startTime,
            let finishTimeLastGrab = mutationRequest.finishTimeLastGrab,
            let finishTimeCleanup = mutationRequest.finishTimeCleanup,
            let dischargeRateTonnesPerHour = mutationRequest.dischargeRateTonnesPerHour,
            let saveAllTarpaulinsUsed = mutationRequest.saveAllTarpaulinsUsed,
            let holdsCleaned = mutationRequest.holdsCleaned,
            let wharfCleaned = mutationRequest.wharfCleaned
        else {
            return nil
        }

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
    }
}

// MARK: MutationRequest

public struct DischargeMutationRequest: DischargePartialProperties, PartialMergable, MutationRequest, Codable, Hashable {
    public var berthName: String?
    public var berthLocation: LocationDTO?
    public var gearID: Int?
    public var methodID: Int?
    public var cargoCondition: CargoConditionDTO?
    public var weatherConditionsID: Int?
    public var startTime: Date?
    public var finishTimeLastGrab: Date?
    public var finishTimeCleanup: Date?
    public var dischargeRateTonnesPerHour: Double?
    public var saveAllTarpaulinsUsed: Bool?
    public var holdsCleaned: Bool?
    public var wharfCleaned: Bool?

    public init(
        berthName: String? = nil,
        berthLocation: LocationDTO? = nil,
        gearID: Int? = nil,
        methodID: Int? = nil,
        cargoCondition: CargoConditionDTO? = nil,
        weatherConditionsID: Int? = nil,
        startTime: Date? = nil,
        finishTimeLastGrab: Date? = nil,
        finishTimeCleanup: Date? = nil,
        dischargeRateTonnesPerHour: Double? = nil,
        saveAllTarpaulinsUsed: Bool? = nil,
        holdsCleaned: Bool? = nil,
        wharfCleaned: Bool? = nil
    ) {
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
    }

    public init(keyAndValues: [String: Any]) {
        if let berthName = keyAndValues["berthName"] as? String {
            self.berthName = berthName
        }
        if let berthLocation = keyAndValues["berthLocation"] as? LocationDTO {
            self.berthLocation = berthLocation
        }
        if let gearID = keyAndValues["gearID"] as? Int {
            self.gearID = gearID
        }
        if let methodID = keyAndValues["methodID"] as? Int {
            self.methodID = methodID
        }
        if let cargoCondition = keyAndValues["cargoCondition"] as? CargoConditionDTO {
            self.cargoCondition = cargoCondition
        }
        if let weatherConditionsID = keyAndValues["weatherConditionsID"] as? Int {
            self.weatherConditionsID = weatherConditionsID
        }
        if let startTime = keyAndValues["startTime"] as? Date {
            self.startTime = startTime
        }
        if let finishTimeLastGrab = keyAndValues["finishTimeLastGrab"] as? Date {
            self.finishTimeLastGrab = finishTimeLastGrab
        }
        if let finishTimeCleanup = keyAndValues["finishTimeCleanup"] as? Date {
            self.finishTimeCleanup = finishTimeCleanup
        }
        if let dischargeRateTonnesPerHour = keyAndValues["dischargeRateTonnesPerHour"] as? Double {
            self.dischargeRateTonnesPerHour = dischargeRateTonnesPerHour
        }
        if let saveAllTarpaulinsUsed = keyAndValues["saveAllTarpaulinsUsed"] as? Bool {
            self.saveAllTarpaulinsUsed = saveAllTarpaulinsUsed
        }
        if let holdsCleaned = keyAndValues["holdsCleaned"] as? Bool {
            self.holdsCleaned = holdsCleaned
        }
        if let wharfCleaned = keyAndValues["wharfCleaned"] as? Bool {
            self.wharfCleaned = wharfCleaned
        }
    }

    public static func empty() -> Self { Self() }

    public mutating func merge(from other: Self) {
        if let updatedValue = other.berthName {
            berthName = updatedValue
        }
        if let updatedValue = other.berthLocation {
            berthLocation = updatedValue
        }
        if let updatedValue = other.gearID {
            gearID = updatedValue
        }
        if let updatedValue = other.methodID {
            methodID = updatedValue
        }
        if let updatedValue = other.cargoCondition {
            cargoCondition = updatedValue
        }
        if let updatedValue = other.weatherConditionsID {
            weatherConditionsID = updatedValue
        }
        if let updatedValue = other.startTime {
            startTime = updatedValue
        }
        if let updatedValue = other.finishTimeLastGrab {
            finishTimeLastGrab = updatedValue
        }
        if let updatedValue = other.finishTimeCleanup {
            finishTimeCleanup = updatedValue
        }
        if let updatedValue = other.dischargeRateTonnesPerHour {
            dischargeRateTonnesPerHour = updatedValue
        }
        if let updatedValue = other.saveAllTarpaulinsUsed {
            saveAllTarpaulinsUsed = updatedValue
        }
        if let updatedValue = other.holdsCleaned {
            holdsCleaned = updatedValue
        }
        if let updatedValue = other.wharfCleaned {
            wharfCleaned = updatedValue
        }
    }
}

// MARK: DTO

public struct DischargeDTO: DischargeProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
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

    public init(
        id: UUID,
        version: Date,
        berthName: String,
        berthLocation: LocationDTO,
        gearID: Int,
        methodID: Int,
        cargoCondition: CargoConditionDTO,
        weatherConditionsID: Int,
        startTime: Date,
        finishTimeLastGrab: Date,
        finishTimeCleanup: Date,
        dischargeRateTonnesPerHour: Double,
        saveAllTarpaulinsUsed: Bool,
        holdsCleaned: Bool,
        wharfCleaned: Bool
    ) {
        self.id = id
        self.version = version
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
    }

    public init?(partial: PartialDischargeDTO) {
        guard
            let berthName = partial.berthName,
            let berthLocation = partial.berthLocation,
            let gearID = partial.gearID,
            let methodID = partial.methodID,
            let cargoCondition = partial.cargoCondition,
            let weatherConditionsID = partial.weatherConditionsID,
            let startTime = partial.startTime,
            let finishTimeLastGrab = partial.finishTimeLastGrab,
            let finishTimeCleanup = partial.finishTimeCleanup,
            let dischargeRateTonnesPerHour = partial.dischargeRateTonnesPerHour,
            let saveAllTarpaulinsUsed = partial.saveAllTarpaulinsUsed,
            let holdsCleaned = partial.holdsCleaned,
            let wharfCleaned = partial.wharfCleaned
        else {
            return nil
        }

        self.id = partial.id
        self.version = partial.version
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
    }

    public init(
        _ creationRequest: DischargeCreationRequest,
        id: UUID,
        version: Date
    ) {
        self.id = id
        self.version = version
        self.berthName = creationRequest.berthName
        self.berthLocation = creationRequest.berthLocation
        self.gearID = creationRequest.gearID
        self.methodID = creationRequest.methodID
        self.cargoCondition = creationRequest.cargoCondition
        self.weatherConditionsID = creationRequest.weatherConditionsID
        self.startTime = creationRequest.startTime
        self.finishTimeLastGrab = creationRequest.finishTimeLastGrab
        self.finishTimeCleanup = creationRequest.finishTimeCleanup
        self.dischargeRateTonnesPerHour = creationRequest.dischargeRateTonnesPerHour
        self.saveAllTarpaulinsUsed = creationRequest.saveAllTarpaulinsUsed
        self.holdsCleaned = creationRequest.holdsCleaned
        self.wharfCleaned = creationRequest.wharfCleaned
    }
}

// MARK: PartialDTO

public struct PartialDischargeDTO: DischargePartialProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
    public let berthName: String?
    public let berthLocation: LocationDTO?
    public let gearID: Int?
    public let methodID: Int?
    public let cargoCondition: CargoConditionDTO?
    public let weatherConditionsID: Int?
    public let startTime: Date?
    public let finishTimeLastGrab: Date?
    public let finishTimeCleanup: Date?
    public let dischargeRateTonnesPerHour: Double?
    public let saveAllTarpaulinsUsed: Bool?
    public let holdsCleaned: Bool?
    public let wharfCleaned: Bool?

    public init(
        id: UUID,
        version: Date,
        berthName: String? = nil,
        berthLocation: LocationDTO? = nil,
        gearID: Int? = nil,
        methodID: Int? = nil,
        cargoCondition: CargoConditionDTO? = nil,
        weatherConditionsID: Int? = nil,
        startTime: Date? = nil,
        finishTimeLastGrab: Date? = nil,
        finishTimeCleanup: Date? = nil,
        dischargeRateTonnesPerHour: Double? = nil,
        saveAllTarpaulinsUsed: Bool? = nil,
        holdsCleaned: Bool? = nil,
        wharfCleaned: Bool? = nil
    ) {
        self.id = id
        self.version = version
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
    }

    public init(
        _ other: DischargeMutationRequest,
        id: UUID,
        version: Date
    ) {
        self.id = id
        self.version = version
        self.berthName = other.berthName
        self.berthLocation = other.berthLocation
        self.gearID = other.gearID
        self.methodID = other.methodID
        self.cargoCondition = other.cargoCondition
        self.weatherConditionsID = other.weatherConditionsID
        self.startTime = other.startTime
        self.finishTimeLastGrab = other.finishTimeLastGrab
        self.finishTimeCleanup = other.finishTimeCleanup
        self.dischargeRateTonnesPerHour = other.dischargeRateTonnesPerHour
        self.saveAllTarpaulinsUsed = other.saveAllTarpaulinsUsed
        self.holdsCleaned = other.holdsCleaned
        self.wharfCleaned = other.wharfCleaned
    }
}

// MARK: - DischargeWeight

// MARK: Protocol

public protocol DischargeWeightProperties {
    var kind: DischargeWeightKind { get }
    var methodID: Int { get }
    var weighingPointID: Int { get }
    var weighingCompany: String { get }
    var startTime: Date { get }
    var finishTime: Date { get }
    var wetMetricTonnes: Double { get }
    var moisturePercentage: Double { get }
    var dryMetricTonnes: Double { get }
    var equipmentName: String? { get }
    var equipmentModel: String? { get }
    var equipmentLocation: LocationDTO? { get }
    var equipmentCertificationDate: Date? { get }
    var calibrationCheck: CalibrationCheck? { get }
    var abcCheck: ABCCheck? { get }
    var tallymen: Tallymen? { get }
    var transparencyID: Int { get }
}

public protocol DischargeWeightPartialProperties {
    var kind: DischargeWeightKind? { get }
    var methodID: Int? { get }
    var weighingPointID: Int? { get }
    var weighingCompany: String? { get }
    var startTime: Date? { get }
    var finishTime: Date? { get }
    var wetMetricTonnes: Double? { get }
    var moisturePercentage: Double? { get }
    var dryMetricTonnes: Double? { get }
    var equipmentName: String?? { get }
    var equipmentModel: String?? { get }
    var equipmentLocation: LocationDTO?? { get }
    var equipmentCertificationDate: Date?? { get }
    var calibrationCheck: CalibrationCheck?? { get }
    var abcCheck: ABCCheck?? { get }
    var tallymen: Tallymen?? { get }
    var transparencyID: Int? { get }
}

// MARK: CreationRequest

public struct DischargeWeightCreationRequest: DischargeWeightProperties, Codable, Hashable {
    public var kind: DischargeWeightKind
    public var methodID: Int
    public var weighingPointID: Int
    public var weighingCompany: String
    public var startTime: Date
    public var finishTime: Date
    public var wetMetricTonnes: Double
    public var moisturePercentage: Double
    public var dryMetricTonnes: Double
    public var equipmentName: String?
    public var equipmentModel: String?
    public var equipmentLocation: LocationDTO?
    public var equipmentCertificationDate: Date?
    public var calibrationCheck: CalibrationCheck?
    public var abcCheck: ABCCheck?
    public var tallymen: Tallymen?
    public var transparencyID: Int

    public init(
        kind: DischargeWeightKind,
        methodID: Int,
        weighingPointID: Int,
        weighingCompany: String,
        startTime: Date,
        finishTime: Date,
        wetMetricTonnes: Double,
        moisturePercentage: Double,
        dryMetricTonnes: Double,
        equipmentName: String?,
        equipmentModel: String?,
        equipmentLocation: LocationDTO?,
        equipmentCertificationDate: Date?,
        calibrationCheck: CalibrationCheck?,
        abcCheck: ABCCheck?,
        tallymen: Tallymen?,
        transparencyID: Int
    ) {
        self.kind = kind
        self.methodID = methodID
        self.weighingPointID = weighingPointID
        self.weighingCompany = weighingCompany
        self.startTime = startTime
        self.finishTime = finishTime
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
        self.equipmentName = equipmentName
        self.equipmentModel = equipmentModel
        self.equipmentLocation = equipmentLocation
        self.equipmentCertificationDate = equipmentCertificationDate
        self.calibrationCheck = calibrationCheck
        self.abcCheck = abcCheck
        self.tallymen = tallymen
        self.transparencyID = transparencyID
    }

    public init?(mutationRequest: DischargeWeightMutationRequest) {
        guard
            let kind = mutationRequest.kind,
            let methodID = mutationRequest.methodID,
            let weighingPointID = mutationRequest.weighingPointID,
            let weighingCompany = mutationRequest.weighingCompany,
            let startTime = mutationRequest.startTime,
            let finishTime = mutationRequest.finishTime,
            let wetMetricTonnes = mutationRequest.wetMetricTonnes,
            let moisturePercentage = mutationRequest.moisturePercentage,
            let dryMetricTonnes = mutationRequest.dryMetricTonnes,
            let equipmentName = mutationRequest.equipmentName,
            let equipmentModel = mutationRequest.equipmentModel,
            let equipmentLocation = mutationRequest.equipmentLocation,
            let equipmentCertificationDate = mutationRequest.equipmentCertificationDate,
            let calibrationCheck = mutationRequest.calibrationCheck,
            let abcCheck = mutationRequest.abcCheck,
            let tallymen = mutationRequest.tallymen,
            let transparencyID = mutationRequest.transparencyID
        else {
            return nil
        }

        self.kind = kind
        self.methodID = methodID
        self.weighingPointID = weighingPointID
        self.weighingCompany = weighingCompany
        self.startTime = startTime
        self.finishTime = finishTime
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
        self.equipmentName = equipmentName
        self.equipmentModel = equipmentModel
        self.equipmentLocation = equipmentLocation
        self.equipmentCertificationDate = equipmentCertificationDate
        self.calibrationCheck = calibrationCheck
        self.abcCheck = abcCheck
        self.tallymen = tallymen
        self.transparencyID = transparencyID
    }
}

// MARK: MutationRequest

public struct DischargeWeightMutationRequest: DischargeWeightPartialProperties, PartialMergable, MutationRequest, Codable, Hashable {
    public var kind: DischargeWeightKind?
    public var methodID: Int?
    public var weighingPointID: Int?
    public var weighingCompany: String?
    public var startTime: Date?
    public var finishTime: Date?
    public var wetMetricTonnes: Double?
    public var moisturePercentage: Double?
    public var dryMetricTonnes: Double?
    public var equipmentName: String??
    public var equipmentModel: String??
    public var equipmentLocation: LocationDTO??
    public var equipmentCertificationDate: Date??
    public var calibrationCheck: CalibrationCheck??
    public var abcCheck: ABCCheck??
    public var tallymen: Tallymen??
    public var transparencyID: Int?

    public init(
        kind: DischargeWeightKind? = nil,
        methodID: Int? = nil,
        weighingPointID: Int? = nil,
        weighingCompany: String? = nil,
        startTime: Date? = nil,
        finishTime: Date? = nil,
        wetMetricTonnes: Double? = nil,
        moisturePercentage: Double? = nil,
        dryMetricTonnes: Double? = nil,
        equipmentName: String?? = nil,
        equipmentModel: String?? = nil,
        equipmentLocation: LocationDTO?? = nil,
        equipmentCertificationDate: Date?? = nil,
        calibrationCheck: CalibrationCheck?? = nil,
        abcCheck: ABCCheck?? = nil,
        tallymen: Tallymen?? = nil,
        transparencyID: Int? = nil
    ) {
        self.kind = kind
        self.methodID = methodID
        self.weighingPointID = weighingPointID
        self.weighingCompany = weighingCompany
        self.startTime = startTime
        self.finishTime = finishTime
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
        self.equipmentName = equipmentName
        self.equipmentModel = equipmentModel
        self.equipmentLocation = equipmentLocation
        self.equipmentCertificationDate = equipmentCertificationDate
        self.calibrationCheck = calibrationCheck
        self.abcCheck = abcCheck
        self.tallymen = tallymen
        self.transparencyID = transparencyID
    }

    public init(keyAndValues: [String: Any]) {
        if let kind = keyAndValues["kind"] as? DischargeWeightKind {
            self.kind = kind
        }
        if let methodID = keyAndValues["methodID"] as? Int {
            self.methodID = methodID
        }
        if let weighingPointID = keyAndValues["weighingPointID"] as? Int {
            self.weighingPointID = weighingPointID
        }
        if let weighingCompany = keyAndValues["weighingCompany"] as? String {
            self.weighingCompany = weighingCompany
        }
        if let startTime = keyAndValues["startTime"] as? Date {
            self.startTime = startTime
        }
        if let finishTime = keyAndValues["finishTime"] as? Date {
            self.finishTime = finishTime
        }
        if let wetMetricTonnes = keyAndValues["wetMetricTonnes"] as? Double {
            self.wetMetricTonnes = wetMetricTonnes
        }
        if let moisturePercentage = keyAndValues["moisturePercentage"] as? Double {
            self.moisturePercentage = moisturePercentage
        }
        if let dryMetricTonnes = keyAndValues["dryMetricTonnes"] as? Double {
            self.dryMetricTonnes = dryMetricTonnes
        }
        if let equipmentName = keyAndValues["equipmentName"] as? String? {
            self.equipmentName = equipmentName
        }
        if let equipmentModel = keyAndValues["equipmentModel"] as? String? {
            self.equipmentModel = equipmentModel
        }
        if let equipmentLocation = keyAndValues["equipmentLocation"] as? LocationDTO? {
            self.equipmentLocation = equipmentLocation
        }
        if let equipmentCertificationDate = keyAndValues["equipmentCertificationDate"] as? Date? {
            self.equipmentCertificationDate = equipmentCertificationDate
        }
        if let calibrationCheck = keyAndValues["calibrationCheck"] as? CalibrationCheck? {
            self.calibrationCheck = calibrationCheck
        }
        if let abcCheck = keyAndValues["abcCheck"] as? ABCCheck? {
            self.abcCheck = abcCheck
        }
        if let tallymen = keyAndValues["tallymen"] as? Tallymen? {
            self.tallymen = tallymen
        }
        if let transparencyID = keyAndValues["transparencyID"] as? Int {
            self.transparencyID = transparencyID
        }
    }

    public static func empty() -> Self { Self() }

    public mutating func merge(from other: Self) {
        if let updatedValue = other.kind {
            kind = updatedValue
        }
        if let updatedValue = other.methodID {
            methodID = updatedValue
        }
        if let updatedValue = other.weighingPointID {
            weighingPointID = updatedValue
        }
        if let updatedValue = other.weighingCompany {
            weighingCompany = updatedValue
        }
        if let updatedValue = other.startTime {
            startTime = updatedValue
        }
        if let updatedValue = other.finishTime {
            finishTime = updatedValue
        }
        if let updatedValue = other.wetMetricTonnes {
            wetMetricTonnes = updatedValue
        }
        if let updatedValue = other.moisturePercentage {
            moisturePercentage = updatedValue
        }
        if let updatedValue = other.dryMetricTonnes {
            dryMetricTonnes = updatedValue
        }
        if let updatedValue = other.equipmentName {
            equipmentName = updatedValue
        }
        if let updatedValue = other.equipmentModel {
            equipmentModel = updatedValue
        }
        if let updatedValue = other.equipmentLocation {
            equipmentLocation = updatedValue
        }
        if let updatedValue = other.equipmentCertificationDate {
            equipmentCertificationDate = updatedValue
        }
        if let updatedValue = other.calibrationCheck {
            calibrationCheck = updatedValue
        }
        if let updatedValue = other.abcCheck {
            abcCheck = updatedValue
        }
        if let updatedValue = other.tallymen {
            tallymen = updatedValue
        }
        if let updatedValue = other.transparencyID {
            transparencyID = updatedValue
        }
    }
}

// MARK: DTO

public struct DischargeWeightDTO: DischargeWeightProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
    public let kind: DischargeWeightKind
    public let methodID: Int
    public let weighingPointID: Int
    public let weighingCompany: String
    public let startTime: Date
    public let finishTime: Date
    public let wetMetricTonnes: Double
    public let moisturePercentage: Double
    public let dryMetricTonnes: Double
    public let equipmentName: String?
    public let equipmentModel: String?
    public let equipmentLocation: LocationDTO?
    public let equipmentCertificationDate: Date?
    public let calibrationCheck: CalibrationCheck?
    public let abcCheck: ABCCheck?
    public let tallymen: Tallymen?
    public let transparencyID: Int

    public init(
        id: UUID,
        version: Date,
        kind: DischargeWeightKind,
        methodID: Int,
        weighingPointID: Int,
        weighingCompany: String,
        startTime: Date,
        finishTime: Date,
        wetMetricTonnes: Double,
        moisturePercentage: Double,
        dryMetricTonnes: Double,
        equipmentName: String?,
        equipmentModel: String?,
        equipmentLocation: LocationDTO?,
        equipmentCertificationDate: Date?,
        calibrationCheck: CalibrationCheck?,
        abcCheck: ABCCheck?,
        tallymen: Tallymen?,
        transparencyID: Int
    ) {
        self.id = id
        self.version = version
        self.kind = kind
        self.methodID = methodID
        self.weighingPointID = weighingPointID
        self.weighingCompany = weighingCompany
        self.startTime = startTime
        self.finishTime = finishTime
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
        self.equipmentName = equipmentName
        self.equipmentModel = equipmentModel
        self.equipmentLocation = equipmentLocation
        self.equipmentCertificationDate = equipmentCertificationDate
        self.calibrationCheck = calibrationCheck
        self.abcCheck = abcCheck
        self.tallymen = tallymen
        self.transparencyID = transparencyID
    }

    public init?(partial: PartialDischargeWeightDTO) {
        guard
            let kind = partial.kind,
            let methodID = partial.methodID,
            let weighingPointID = partial.weighingPointID,
            let weighingCompany = partial.weighingCompany,
            let startTime = partial.startTime,
            let finishTime = partial.finishTime,
            let wetMetricTonnes = partial.wetMetricTonnes,
            let moisturePercentage = partial.moisturePercentage,
            let dryMetricTonnes = partial.dryMetricTonnes,
            let equipmentName = partial.equipmentName,
            let equipmentModel = partial.equipmentModel,
            let equipmentLocation = partial.equipmentLocation,
            let equipmentCertificationDate = partial.equipmentCertificationDate,
            let calibrationCheck = partial.calibrationCheck,
            let abcCheck = partial.abcCheck,
            let tallymen = partial.tallymen,
            let transparencyID = partial.transparencyID
        else {
            return nil
        }

        self.id = partial.id
        self.version = partial.version
        self.kind = kind
        self.methodID = methodID
        self.weighingPointID = weighingPointID
        self.weighingCompany = weighingCompany
        self.startTime = startTime
        self.finishTime = finishTime
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
        self.equipmentName = equipmentName
        self.equipmentModel = equipmentModel
        self.equipmentLocation = equipmentLocation
        self.equipmentCertificationDate = equipmentCertificationDate
        self.calibrationCheck = calibrationCheck
        self.abcCheck = abcCheck
        self.tallymen = tallymen
        self.transparencyID = transparencyID
    }

    public init(
        _ creationRequest: DischargeWeightCreationRequest,
        id: UUID,
        version: Date
    ) {
        self.id = id
        self.version = version
        self.kind = creationRequest.kind
        self.methodID = creationRequest.methodID
        self.weighingPointID = creationRequest.weighingPointID
        self.weighingCompany = creationRequest.weighingCompany
        self.startTime = creationRequest.startTime
        self.finishTime = creationRequest.finishTime
        self.wetMetricTonnes = creationRequest.wetMetricTonnes
        self.moisturePercentage = creationRequest.moisturePercentage
        self.dryMetricTonnes = creationRequest.dryMetricTonnes
        self.equipmentName = creationRequest.equipmentName
        self.equipmentModel = creationRequest.equipmentModel
        self.equipmentLocation = creationRequest.equipmentLocation
        self.equipmentCertificationDate = creationRequest.equipmentCertificationDate
        self.calibrationCheck = creationRequest.calibrationCheck
        self.abcCheck = creationRequest.abcCheck
        self.tallymen = creationRequest.tallymen
        self.transparencyID = creationRequest.transparencyID
    }
}

// MARK: PartialDTO

public struct PartialDischargeWeightDTO: DischargeWeightPartialProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
    public let kind: DischargeWeightKind?
    public let methodID: Int?
    public let weighingPointID: Int?
    public let weighingCompany: String?
    public let startTime: Date?
    public let finishTime: Date?
    public let wetMetricTonnes: Double?
    public let moisturePercentage: Double?
    public let dryMetricTonnes: Double?
    public let equipmentName: String??
    public let equipmentModel: String??
    public let equipmentLocation: LocationDTO??
    public let equipmentCertificationDate: Date??
    public let calibrationCheck: CalibrationCheck??
    public let abcCheck: ABCCheck??
    public let tallymen: Tallymen??
    public let transparencyID: Int?

    public init(
        id: UUID,
        version: Date,
        kind: DischargeWeightKind? = nil,
        methodID: Int? = nil,
        weighingPointID: Int? = nil,
        weighingCompany: String? = nil,
        startTime: Date? = nil,
        finishTime: Date? = nil,
        wetMetricTonnes: Double? = nil,
        moisturePercentage: Double? = nil,
        dryMetricTonnes: Double? = nil,
        equipmentName: String?? = nil,
        equipmentModel: String?? = nil,
        equipmentLocation: LocationDTO?? = nil,
        equipmentCertificationDate: Date?? = nil,
        calibrationCheck: CalibrationCheck?? = nil,
        abcCheck: ABCCheck?? = nil,
        tallymen: Tallymen?? = nil,
        transparencyID: Int? = nil
    ) {
        self.id = id
        self.version = version
        self.kind = kind
        self.methodID = methodID
        self.weighingPointID = weighingPointID
        self.weighingCompany = weighingCompany
        self.startTime = startTime
        self.finishTime = finishTime
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
        self.equipmentName = equipmentName
        self.equipmentModel = equipmentModel
        self.equipmentLocation = equipmentLocation
        self.equipmentCertificationDate = equipmentCertificationDate
        self.calibrationCheck = calibrationCheck
        self.abcCheck = abcCheck
        self.tallymen = tallymen
        self.transparencyID = transparencyID
    }

    public init(
        _ other: DischargeWeightMutationRequest,
        id: UUID,
        version: Date
    ) {
        self.id = id
        self.version = version
        self.kind = other.kind
        self.methodID = other.methodID
        self.weighingPointID = other.weighingPointID
        self.weighingCompany = other.weighingCompany
        self.startTime = other.startTime
        self.finishTime = other.finishTime
        self.wetMetricTonnes = other.wetMetricTonnes
        self.moisturePercentage = other.moisturePercentage
        self.dryMetricTonnes = other.dryMetricTonnes
        self.equipmentName = other.equipmentName
        self.equipmentModel = other.equipmentModel
        self.equipmentLocation = other.equipmentLocation
        self.equipmentCertificationDate = other.equipmentCertificationDate
        self.calibrationCheck = other.calibrationCheck
        self.abcCheck = other.abcCheck
        self.tallymen = other.tallymen
        self.transparencyID = other.transparencyID
    }
}

// MARK: - MoistureDetermination

// MARK: Protocol

public protocol MoistureDeterminationProperties {
    var moistureDeterminationCompanyID: Int { get }
    var siteID: Int { get }
    var location: LocationDTO { get }
    var lotSampleTrayWeightKilograms: Double { get }
    var ovenOnTime: Date { get }
    var ovenOffTime: Date { get }
    var ovenTemperatureCelsius: Int { get }
    var constantWeightCheck: ConstantWeightCheck? { get }
    var resultsWaitTimeDays: Int { get }
    var transparencyID: Int { get }
}

public protocol MoistureDeterminationPartialProperties {
    var moistureDeterminationCompanyID: Int? { get }
    var siteID: Int? { get }
    var location: LocationDTO? { get }
    var lotSampleTrayWeightKilograms: Double? { get }
    var ovenOnTime: Date? { get }
    var ovenOffTime: Date? { get }
    var ovenTemperatureCelsius: Int? { get }
    var constantWeightCheck: ConstantWeightCheck?? { get }
    var resultsWaitTimeDays: Int? { get }
    var transparencyID: Int? { get }
}

// MARK: CreationRequest

public struct MoistureDeterminationCreationRequest: MoistureDeterminationProperties, Codable, Hashable {
    public var moistureDeterminationCompanyID: Int
    public var siteID: Int
    public var location: LocationDTO
    public var lotSampleTrayWeightKilograms: Double
    public var ovenOnTime: Date
    public var ovenOffTime: Date
    public var ovenTemperatureCelsius: Int
    public var constantWeightCheck: ConstantWeightCheck?
    public var resultsWaitTimeDays: Int
    public var transparencyID: Int

    public init(
        moistureDeterminationCompanyID: Int,
        siteID: Int,
        location: LocationDTO,
        lotSampleTrayWeightKilograms: Double,
        ovenOnTime: Date,
        ovenOffTime: Date,
        ovenTemperatureCelsius: Int,
        constantWeightCheck: ConstantWeightCheck?,
        resultsWaitTimeDays: Int,
        transparencyID: Int
    ) {
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
    }

    public init?(mutationRequest: MoistureDeterminationMutationRequest) {
        guard
            let moistureDeterminationCompanyID = mutationRequest.moistureDeterminationCompanyID,
            let siteID = mutationRequest.siteID,
            let location = mutationRequest.location,
            let lotSampleTrayWeightKilograms = mutationRequest.lotSampleTrayWeightKilograms,
            let ovenOnTime = mutationRequest.ovenOnTime,
            let ovenOffTime = mutationRequest.ovenOffTime,
            let ovenTemperatureCelsius = mutationRequest.ovenTemperatureCelsius,
            let constantWeightCheck = mutationRequest.constantWeightCheck,
            let resultsWaitTimeDays = mutationRequest.resultsWaitTimeDays,
            let transparencyID = mutationRequest.transparencyID
        else {
            return nil
        }

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
    }
}

// MARK: MutationRequest

public struct MoistureDeterminationMutationRequest: MoistureDeterminationPartialProperties, PartialMergable, MutationRequest, Codable, Hashable {
    public var moistureDeterminationCompanyID: Int?
    public var siteID: Int?
    public var location: LocationDTO?
    public var lotSampleTrayWeightKilograms: Double?
    public var ovenOnTime: Date?
    public var ovenOffTime: Date?
    public var ovenTemperatureCelsius: Int?
    public var constantWeightCheck: ConstantWeightCheck??
    public var resultsWaitTimeDays: Int?
    public var transparencyID: Int?

    public init(
        moistureDeterminationCompanyID: Int? = nil,
        siteID: Int? = nil,
        location: LocationDTO? = nil,
        lotSampleTrayWeightKilograms: Double? = nil,
        ovenOnTime: Date? = nil,
        ovenOffTime: Date? = nil,
        ovenTemperatureCelsius: Int? = nil,
        constantWeightCheck: ConstantWeightCheck?? = nil,
        resultsWaitTimeDays: Int? = nil,
        transparencyID: Int? = nil
    ) {
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
    }

    public init(keyAndValues: [String: Any]) {
        if let moistureDeterminationCompanyID = keyAndValues["moistureDeterminationCompanyID"] as? Int {
            self.moistureDeterminationCompanyID = moistureDeterminationCompanyID
        }
        if let siteID = keyAndValues["siteID"] as? Int {
            self.siteID = siteID
        }
        if let location = keyAndValues["location"] as? LocationDTO {
            self.location = location
        }
        if let lotSampleTrayWeightKilograms = keyAndValues["lotSampleTrayWeightKilograms"] as? Double {
            self.lotSampleTrayWeightKilograms = lotSampleTrayWeightKilograms
        }
        if let ovenOnTime = keyAndValues["ovenOnTime"] as? Date {
            self.ovenOnTime = ovenOnTime
        }
        if let ovenOffTime = keyAndValues["ovenOffTime"] as? Date {
            self.ovenOffTime = ovenOffTime
        }
        if let ovenTemperatureCelsius = keyAndValues["ovenTemperatureCelsius"] as? Int {
            self.ovenTemperatureCelsius = ovenTemperatureCelsius
        }
        if let constantWeightCheck = keyAndValues["constantWeightCheck"] as? ConstantWeightCheck? {
            self.constantWeightCheck = constantWeightCheck
        }
        if let resultsWaitTimeDays = keyAndValues["resultsWaitTimeDays"] as? Int {
            self.resultsWaitTimeDays = resultsWaitTimeDays
        }
        if let transparencyID = keyAndValues["transparencyID"] as? Int {
            self.transparencyID = transparencyID
        }
    }

    public static func empty() -> Self { Self() }

    public mutating func merge(from other: Self) {
        if let updatedValue = other.moistureDeterminationCompanyID {
            moistureDeterminationCompanyID = updatedValue
        }
        if let updatedValue = other.siteID {
            siteID = updatedValue
        }
        if let updatedValue = other.location {
            location = updatedValue
        }
        if let updatedValue = other.lotSampleTrayWeightKilograms {
            lotSampleTrayWeightKilograms = updatedValue
        }
        if let updatedValue = other.ovenOnTime {
            ovenOnTime = updatedValue
        }
        if let updatedValue = other.ovenOffTime {
            ovenOffTime = updatedValue
        }
        if let updatedValue = other.ovenTemperatureCelsius {
            ovenTemperatureCelsius = updatedValue
        }
        if let updatedValue = other.constantWeightCheck {
            constantWeightCheck = updatedValue
        }
        if let updatedValue = other.resultsWaitTimeDays {
            resultsWaitTimeDays = updatedValue
        }
        if let updatedValue = other.transparencyID {
            transparencyID = updatedValue
        }
    }
}

// MARK: DTO

public struct MoistureDeterminationDTO: MoistureDeterminationProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
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

    public init(
        id: UUID,
        version: Date,
        moistureDeterminationCompanyID: Int,
        siteID: Int,
        location: LocationDTO,
        lotSampleTrayWeightKilograms: Double,
        ovenOnTime: Date,
        ovenOffTime: Date,
        ovenTemperatureCelsius: Int,
        constantWeightCheck: ConstantWeightCheck?,
        resultsWaitTimeDays: Int,
        transparencyID: Int
    ) {
        self.id = id
        self.version = version
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
    }

    public init?(partial: PartialMoistureDeterminationDTO) {
        guard
            let moistureDeterminationCompanyID = partial.moistureDeterminationCompanyID,
            let siteID = partial.siteID,
            let location = partial.location,
            let lotSampleTrayWeightKilograms = partial.lotSampleTrayWeightKilograms,
            let ovenOnTime = partial.ovenOnTime,
            let ovenOffTime = partial.ovenOffTime,
            let ovenTemperatureCelsius = partial.ovenTemperatureCelsius,
            let constantWeightCheck = partial.constantWeightCheck,
            let resultsWaitTimeDays = partial.resultsWaitTimeDays,
            let transparencyID = partial.transparencyID
        else {
            return nil
        }

        self.id = partial.id
        self.version = partial.version
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
    }

    public init(
        _ creationRequest: MoistureDeterminationCreationRequest,
        id: UUID,
        version: Date
    ) {
        self.id = id
        self.version = version
        self.moistureDeterminationCompanyID = creationRequest.moistureDeterminationCompanyID
        self.siteID = creationRequest.siteID
        self.location = creationRequest.location
        self.lotSampleTrayWeightKilograms = creationRequest.lotSampleTrayWeightKilograms
        self.ovenOnTime = creationRequest.ovenOnTime
        self.ovenOffTime = creationRequest.ovenOffTime
        self.ovenTemperatureCelsius = creationRequest.ovenTemperatureCelsius
        self.constantWeightCheck = creationRequest.constantWeightCheck
        self.resultsWaitTimeDays = creationRequest.resultsWaitTimeDays
        self.transparencyID = creationRequest.transparencyID
    }
}

// MARK: PartialDTO

public struct PartialMoistureDeterminationDTO: MoistureDeterminationPartialProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
    public let moistureDeterminationCompanyID: Int?
    public let siteID: Int?
    public let location: LocationDTO?
    public let lotSampleTrayWeightKilograms: Double?
    public let ovenOnTime: Date?
    public let ovenOffTime: Date?
    public let ovenTemperatureCelsius: Int?
    public let constantWeightCheck: ConstantWeightCheck??
    public let resultsWaitTimeDays: Int?
    public let transparencyID: Int?

    public init(
        id: UUID,
        version: Date,
        moistureDeterminationCompanyID: Int? = nil,
        siteID: Int? = nil,
        location: LocationDTO? = nil,
        lotSampleTrayWeightKilograms: Double? = nil,
        ovenOnTime: Date? = nil,
        ovenOffTime: Date? = nil,
        ovenTemperatureCelsius: Int? = nil,
        constantWeightCheck: ConstantWeightCheck?? = nil,
        resultsWaitTimeDays: Int? = nil,
        transparencyID: Int? = nil
    ) {
        self.id = id
        self.version = version
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
    }

    public init(
        _ other: MoistureDeterminationMutationRequest,
        id: UUID,
        version: Date
    ) {
        self.id = id
        self.version = version
        self.moistureDeterminationCompanyID = other.moistureDeterminationCompanyID
        self.siteID = other.siteID
        self.location = other.location
        self.lotSampleTrayWeightKilograms = other.lotSampleTrayWeightKilograms
        self.ovenOnTime = other.ovenOnTime
        self.ovenOffTime = other.ovenOffTime
        self.ovenTemperatureCelsius = other.ovenTemperatureCelsius
        self.constantWeightCheck = other.constantWeightCheck
        self.resultsWaitTimeDays = other.resultsWaitTimeDays
        self.transparencyID = other.transparencyID
    }
}

// MARK: - SampleCollection

// MARK: Protocol

public protocol SampleCollectionProperties {
    var samplingCompanyID: Int { get }
    var siteID: Int { get }
    var location: LocationDTO { get }
    var samplingPointID: Int { get }
    var startTime: Date { get }
    var finishTime: Date { get }
    var methodID: Int { get }
    var sampleIncrementsWetTonnes: Double { get }
    var typicalSampleWeightKilograms: Double { get }
    var numberOfTrucksPerBag: Int? { get }
    var lotSizeWetTonnes: Int { get }
    var sublotSizeWetTonnes: Int? { get }
    var numberOfLots: Int { get }
}

public protocol SampleCollectionPartialProperties {
    var samplingCompanyID: Int? { get }
    var siteID: Int? { get }
    var location: LocationDTO? { get }
    var samplingPointID: Int? { get }
    var startTime: Date? { get }
    var finishTime: Date? { get }
    var methodID: Int? { get }
    var sampleIncrementsWetTonnes: Double? { get }
    var typicalSampleWeightKilograms: Double? { get }
    var numberOfTrucksPerBag: Int?? { get }
    var lotSizeWetTonnes: Int? { get }
    var sublotSizeWetTonnes: Int?? { get }
    var numberOfLots: Int? { get }
}

// MARK: CreationRequest

public struct SampleCollectionCreationRequest: SampleCollectionProperties, Codable, Hashable {
    public var samplingCompanyID: Int
    public var siteID: Int
    public var location: LocationDTO
    public var samplingPointID: Int
    public var startTime: Date
    public var finishTime: Date
    public var methodID: Int
    public var sampleIncrementsWetTonnes: Double
    public var typicalSampleWeightKilograms: Double
    public var numberOfTrucksPerBag: Int?
    public var lotSizeWetTonnes: Int
    public var sublotSizeWetTonnes: Int?
    public var numberOfLots: Int

    public init(
        samplingCompanyID: Int,
        siteID: Int,
        location: LocationDTO,
        samplingPointID: Int,
        startTime: Date,
        finishTime: Date,
        methodID: Int,
        sampleIncrementsWetTonnes: Double,
        typicalSampleWeightKilograms: Double,
        numberOfTrucksPerBag: Int?,
        lotSizeWetTonnes: Int,
        sublotSizeWetTonnes: Int?,
        numberOfLots: Int
    ) {
        self.samplingCompanyID = samplingCompanyID
        self.siteID = siteID
        self.location = location
        self.samplingPointID = samplingPointID
        self.startTime = startTime
        self.finishTime = finishTime
        self.methodID = methodID
        self.sampleIncrementsWetTonnes = sampleIncrementsWetTonnes
        self.typicalSampleWeightKilograms = typicalSampleWeightKilograms
        self.numberOfTrucksPerBag = numberOfTrucksPerBag
        self.lotSizeWetTonnes = lotSizeWetTonnes
        self.sublotSizeWetTonnes = sublotSizeWetTonnes
        self.numberOfLots = numberOfLots
    }

    public init?(mutationRequest: SampleCollectionMutationRequest) {
        guard
            let samplingCompanyID = mutationRequest.samplingCompanyID,
            let siteID = mutationRequest.siteID,
            let location = mutationRequest.location,
            let samplingPointID = mutationRequest.samplingPointID,
            let startTime = mutationRequest.startTime,
            let finishTime = mutationRequest.finishTime,
            let methodID = mutationRequest.methodID,
            let sampleIncrementsWetTonnes = mutationRequest.sampleIncrementsWetTonnes,
            let typicalSampleWeightKilograms = mutationRequest.typicalSampleWeightKilograms,
            let numberOfTrucksPerBag = mutationRequest.numberOfTrucksPerBag,
            let lotSizeWetTonnes = mutationRequest.lotSizeWetTonnes,
            let sublotSizeWetTonnes = mutationRequest.sublotSizeWetTonnes,
            let numberOfLots = mutationRequest.numberOfLots
        else {
            return nil
        }

        self.samplingCompanyID = samplingCompanyID
        self.siteID = siteID
        self.location = location
        self.samplingPointID = samplingPointID
        self.startTime = startTime
        self.finishTime = finishTime
        self.methodID = methodID
        self.sampleIncrementsWetTonnes = sampleIncrementsWetTonnes
        self.typicalSampleWeightKilograms = typicalSampleWeightKilograms
        self.numberOfTrucksPerBag = numberOfTrucksPerBag
        self.lotSizeWetTonnes = lotSizeWetTonnes
        self.sublotSizeWetTonnes = sublotSizeWetTonnes
        self.numberOfLots = numberOfLots
    }
}

// MARK: MutationRequest

public struct SampleCollectionMutationRequest: SampleCollectionPartialProperties, PartialMergable, MutationRequest, Codable, Hashable {
    public var samplingCompanyID: Int?
    public var siteID: Int?
    public var location: LocationDTO?
    public var samplingPointID: Int?
    public var startTime: Date?
    public var finishTime: Date?
    public var methodID: Int?
    public var sampleIncrementsWetTonnes: Double?
    public var typicalSampleWeightKilograms: Double?
    public var numberOfTrucksPerBag: Int??
    public var lotSizeWetTonnes: Int?
    public var sublotSizeWetTonnes: Int??
    public var numberOfLots: Int?

    public init(
        samplingCompanyID: Int? = nil,
        siteID: Int? = nil,
        location: LocationDTO? = nil,
        samplingPointID: Int? = nil,
        startTime: Date? = nil,
        finishTime: Date? = nil,
        methodID: Int? = nil,
        sampleIncrementsWetTonnes: Double? = nil,
        typicalSampleWeightKilograms: Double? = nil,
        numberOfTrucksPerBag: Int?? = nil,
        lotSizeWetTonnes: Int? = nil,
        sublotSizeWetTonnes: Int?? = nil,
        numberOfLots: Int? = nil
    ) {
        self.samplingCompanyID = samplingCompanyID
        self.siteID = siteID
        self.location = location
        self.samplingPointID = samplingPointID
        self.startTime = startTime
        self.finishTime = finishTime
        self.methodID = methodID
        self.sampleIncrementsWetTonnes = sampleIncrementsWetTonnes
        self.typicalSampleWeightKilograms = typicalSampleWeightKilograms
        self.numberOfTrucksPerBag = numberOfTrucksPerBag
        self.lotSizeWetTonnes = lotSizeWetTonnes
        self.sublotSizeWetTonnes = sublotSizeWetTonnes
        self.numberOfLots = numberOfLots
    }

    public init(keyAndValues: [String: Any]) {
        if let samplingCompanyID = keyAndValues["samplingCompanyID"] as? Int {
            self.samplingCompanyID = samplingCompanyID
        }
        if let siteID = keyAndValues["siteID"] as? Int {
            self.siteID = siteID
        }
        if let location = keyAndValues["location"] as? LocationDTO {
            self.location = location
        }
        if let samplingPointID = keyAndValues["samplingPointID"] as? Int {
            self.samplingPointID = samplingPointID
        }
        if let startTime = keyAndValues["startTime"] as? Date {
            self.startTime = startTime
        }
        if let finishTime = keyAndValues["finishTime"] as? Date {
            self.finishTime = finishTime
        }
        if let methodID = keyAndValues["methodID"] as? Int {
            self.methodID = methodID
        }
        if let sampleIncrementsWetTonnes = keyAndValues["sampleIncrementsWetTonnes"] as? Double {
            self.sampleIncrementsWetTonnes = sampleIncrementsWetTonnes
        }
        if let typicalSampleWeightKilograms = keyAndValues["typicalSampleWeightKilograms"] as? Double {
            self.typicalSampleWeightKilograms = typicalSampleWeightKilograms
        }
        if let numberOfTrucksPerBag = keyAndValues["numberOfTrucksPerBag"] as? Int? {
            self.numberOfTrucksPerBag = numberOfTrucksPerBag
        }
        if let lotSizeWetTonnes = keyAndValues["lotSizeWetTonnes"] as? Int {
            self.lotSizeWetTonnes = lotSizeWetTonnes
        }
        if let sublotSizeWetTonnes = keyAndValues["sublotSizeWetTonnes"] as? Int? {
            self.sublotSizeWetTonnes = sublotSizeWetTonnes
        }
        if let numberOfLots = keyAndValues["numberOfLots"] as? Int {
            self.numberOfLots = numberOfLots
        }
    }

    public static func empty() -> Self { Self() }

    public mutating func merge(from other: Self) {
        if let updatedValue = other.samplingCompanyID {
            samplingCompanyID = updatedValue
        }
        if let updatedValue = other.siteID {
            siteID = updatedValue
        }
        if let updatedValue = other.location {
            location = updatedValue
        }
        if let updatedValue = other.samplingPointID {
            samplingPointID = updatedValue
        }
        if let updatedValue = other.startTime {
            startTime = updatedValue
        }
        if let updatedValue = other.finishTime {
            finishTime = updatedValue
        }
        if let updatedValue = other.methodID {
            methodID = updatedValue
        }
        if let updatedValue = other.sampleIncrementsWetTonnes {
            sampleIncrementsWetTonnes = updatedValue
        }
        if let updatedValue = other.typicalSampleWeightKilograms {
            typicalSampleWeightKilograms = updatedValue
        }
        if let updatedValue = other.numberOfTrucksPerBag {
            numberOfTrucksPerBag = updatedValue
        }
        if let updatedValue = other.lotSizeWetTonnes {
            lotSizeWetTonnes = updatedValue
        }
        if let updatedValue = other.sublotSizeWetTonnes {
            sublotSizeWetTonnes = updatedValue
        }
        if let updatedValue = other.numberOfLots {
            numberOfLots = updatedValue
        }
    }
}

// MARK: DTO

public struct SampleCollectionDTO: SampleCollectionProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
    public let samplingCompanyID: Int
    public let siteID: Int
    public let location: LocationDTO
    public let samplingPointID: Int
    public let startTime: Date
    public let finishTime: Date
    public let methodID: Int
    public let sampleIncrementsWetTonnes: Double
    public let typicalSampleWeightKilograms: Double
    public let numberOfTrucksPerBag: Int?
    public let lotSizeWetTonnes: Int
    public let sublotSizeWetTonnes: Int?
    public let numberOfLots: Int

    public init(
        id: UUID,
        version: Date,
        samplingCompanyID: Int,
        siteID: Int,
        location: LocationDTO,
        samplingPointID: Int,
        startTime: Date,
        finishTime: Date,
        methodID: Int,
        sampleIncrementsWetTonnes: Double,
        typicalSampleWeightKilograms: Double,
        numberOfTrucksPerBag: Int?,
        lotSizeWetTonnes: Int,
        sublotSizeWetTonnes: Int?,
        numberOfLots: Int
    ) {
        self.id = id
        self.version = version
        self.samplingCompanyID = samplingCompanyID
        self.siteID = siteID
        self.location = location
        self.samplingPointID = samplingPointID
        self.startTime = startTime
        self.finishTime = finishTime
        self.methodID = methodID
        self.sampleIncrementsWetTonnes = sampleIncrementsWetTonnes
        self.typicalSampleWeightKilograms = typicalSampleWeightKilograms
        self.numberOfTrucksPerBag = numberOfTrucksPerBag
        self.lotSizeWetTonnes = lotSizeWetTonnes
        self.sublotSizeWetTonnes = sublotSizeWetTonnes
        self.numberOfLots = numberOfLots
    }

    public init?(partial: PartialSampleCollectionDTO) {
        guard
            let samplingCompanyID = partial.samplingCompanyID,
            let siteID = partial.siteID,
            let location = partial.location,
            let samplingPointID = partial.samplingPointID,
            let startTime = partial.startTime,
            let finishTime = partial.finishTime,
            let methodID = partial.methodID,
            let sampleIncrementsWetTonnes = partial.sampleIncrementsWetTonnes,
            let typicalSampleWeightKilograms = partial.typicalSampleWeightKilograms,
            let numberOfTrucksPerBag = partial.numberOfTrucksPerBag,
            let lotSizeWetTonnes = partial.lotSizeWetTonnes,
            let sublotSizeWetTonnes = partial.sublotSizeWetTonnes,
            let numberOfLots = partial.numberOfLots
        else {
            return nil
        }

        self.id = partial.id
        self.version = partial.version
        self.samplingCompanyID = samplingCompanyID
        self.siteID = siteID
        self.location = location
        self.samplingPointID = samplingPointID
        self.startTime = startTime
        self.finishTime = finishTime
        self.methodID = methodID
        self.sampleIncrementsWetTonnes = sampleIncrementsWetTonnes
        self.typicalSampleWeightKilograms = typicalSampleWeightKilograms
        self.numberOfTrucksPerBag = numberOfTrucksPerBag
        self.lotSizeWetTonnes = lotSizeWetTonnes
        self.sublotSizeWetTonnes = sublotSizeWetTonnes
        self.numberOfLots = numberOfLots
    }

    public init(
        _ creationRequest: SampleCollectionCreationRequest,
        id: UUID,
        version: Date
    ) {
        self.id = id
        self.version = version
        self.samplingCompanyID = creationRequest.samplingCompanyID
        self.siteID = creationRequest.siteID
        self.location = creationRequest.location
        self.samplingPointID = creationRequest.samplingPointID
        self.startTime = creationRequest.startTime
        self.finishTime = creationRequest.finishTime
        self.methodID = creationRequest.methodID
        self.sampleIncrementsWetTonnes = creationRequest.sampleIncrementsWetTonnes
        self.typicalSampleWeightKilograms = creationRequest.typicalSampleWeightKilograms
        self.numberOfTrucksPerBag = creationRequest.numberOfTrucksPerBag
        self.lotSizeWetTonnes = creationRequest.lotSizeWetTonnes
        self.sublotSizeWetTonnes = creationRequest.sublotSizeWetTonnes
        self.numberOfLots = creationRequest.numberOfLots
    }
}

// MARK: PartialDTO

public struct PartialSampleCollectionDTO: SampleCollectionPartialProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
    public let samplingCompanyID: Int?
    public let siteID: Int?
    public let location: LocationDTO?
    public let samplingPointID: Int?
    public let startTime: Date?
    public let finishTime: Date?
    public let methodID: Int?
    public let sampleIncrementsWetTonnes: Double?
    public let typicalSampleWeightKilograms: Double?
    public let numberOfTrucksPerBag: Int??
    public let lotSizeWetTonnes: Int?
    public let sublotSizeWetTonnes: Int??
    public let numberOfLots: Int?

    public init(
        id: UUID,
        version: Date,
        samplingCompanyID: Int? = nil,
        siteID: Int? = nil,
        location: LocationDTO? = nil,
        samplingPointID: Int? = nil,
        startTime: Date? = nil,
        finishTime: Date? = nil,
        methodID: Int? = nil,
        sampleIncrementsWetTonnes: Double? = nil,
        typicalSampleWeightKilograms: Double? = nil,
        numberOfTrucksPerBag: Int?? = nil,
        lotSizeWetTonnes: Int? = nil,
        sublotSizeWetTonnes: Int?? = nil,
        numberOfLots: Int? = nil
    ) {
        self.id = id
        self.version = version
        self.samplingCompanyID = samplingCompanyID
        self.siteID = siteID
        self.location = location
        self.samplingPointID = samplingPointID
        self.startTime = startTime
        self.finishTime = finishTime
        self.methodID = methodID
        self.sampleIncrementsWetTonnes = sampleIncrementsWetTonnes
        self.typicalSampleWeightKilograms = typicalSampleWeightKilograms
        self.numberOfTrucksPerBag = numberOfTrucksPerBag
        self.lotSizeWetTonnes = lotSizeWetTonnes
        self.sublotSizeWetTonnes = sublotSizeWetTonnes
        self.numberOfLots = numberOfLots
    }

    public init(
        _ other: SampleCollectionMutationRequest,
        id: UUID,
        version: Date
    ) {
        self.id = id
        self.version = version
        self.samplingCompanyID = other.samplingCompanyID
        self.siteID = other.siteID
        self.location = other.location
        self.samplingPointID = other.samplingPointID
        self.startTime = other.startTime
        self.finishTime = other.finishTime
        self.methodID = other.methodID
        self.sampleIncrementsWetTonnes = other.sampleIncrementsWetTonnes
        self.typicalSampleWeightKilograms = other.typicalSampleWeightKilograms
        self.numberOfTrucksPerBag = other.numberOfTrucksPerBag
        self.lotSizeWetTonnes = other.lotSizeWetTonnes
        self.sublotSizeWetTonnes = other.sublotSizeWetTonnes
        self.numberOfLots = other.numberOfLots
    }
}

// MARK: - SamplePreparation

// MARK: Protocol

public protocol SamplePreparationProperties {
    var preparationCompanyID: Int { get }
    var siteID: Int { get }
    var location: LocationDTO { get }
    var startTime: Date { get }
    var finishTime: Date { get }
    var standardsID: Int { get }
    var wasScreened: Bool { get }
    var screenApertureID: Int? { get }
    var oversizePulverizedSeparately: Bool? { get }
    var sampleChargeWeightGrams: Int { get }
    var pulverizerID: Int { get }
    var pulverizingDurationSeconds: TimeInterval { get }
    var divisionMethodID: Int { get }
    var rsdNumberOfSegments: Int? { get }
    var incrementISOScoopUsed: Bool? { get }
    var incrementBackingPlateUsed: Bool? { get }
    var incrementDividedToExtinction: Bool? { get }
    var riffleApertureMillimetres: Int? { get }
    var numberOfSets: Int { get }
    var transparencyID: Int { get }
}

public protocol SamplePreparationPartialProperties {
    var preparationCompanyID: Int? { get }
    var siteID: Int? { get }
    var location: LocationDTO? { get }
    var startTime: Date? { get }
    var finishTime: Date? { get }
    var standardsID: Int? { get }
    var wasScreened: Bool? { get }
    var screenApertureID: Int?? { get }
    var oversizePulverizedSeparately: Bool?? { get }
    var sampleChargeWeightGrams: Int? { get }
    var pulverizerID: Int? { get }
    var pulverizingDurationSeconds: TimeInterval? { get }
    var divisionMethodID: Int? { get }
    var rsdNumberOfSegments: Int?? { get }
    var incrementISOScoopUsed: Bool?? { get }
    var incrementBackingPlateUsed: Bool?? { get }
    var incrementDividedToExtinction: Bool?? { get }
    var riffleApertureMillimetres: Int?? { get }
    var numberOfSets: Int? { get }
    var transparencyID: Int? { get }
}

// MARK: CreationRequest

public struct SamplePreparationCreationRequest: SamplePreparationProperties, Codable, Hashable {
    public var preparationCompanyID: Int
    public var siteID: Int
    public var location: LocationDTO
    public var startTime: Date
    public var finishTime: Date
    public var standardsID: Int
    public var wasScreened: Bool
    public var screenApertureID: Int?
    public var oversizePulverizedSeparately: Bool?
    public var sampleChargeWeightGrams: Int
    public var pulverizerID: Int
    public var pulverizingDurationSeconds: TimeInterval
    public var divisionMethodID: Int
    public var rsdNumberOfSegments: Int?
    public var incrementISOScoopUsed: Bool?
    public var incrementBackingPlateUsed: Bool?
    public var incrementDividedToExtinction: Bool?
    public var riffleApertureMillimetres: Int?
    public var numberOfSets: Int
    public var transparencyID: Int

    public init(
        preparationCompanyID: Int,
        siteID: Int,
        location: LocationDTO,
        startTime: Date,
        finishTime: Date,
        standardsID: Int,
        wasScreened: Bool,
        screenApertureID: Int?,
        oversizePulverizedSeparately: Bool?,
        sampleChargeWeightGrams: Int,
        pulverizerID: Int,
        pulverizingDurationSeconds: TimeInterval,
        divisionMethodID: Int,
        rsdNumberOfSegments: Int?,
        incrementISOScoopUsed: Bool?,
        incrementBackingPlateUsed: Bool?,
        incrementDividedToExtinction: Bool?,
        riffleApertureMillimetres: Int?,
        numberOfSets: Int,
        transparencyID: Int
    ) {
        self.preparationCompanyID = preparationCompanyID
        self.siteID = siteID
        self.location = location
        self.startTime = startTime
        self.finishTime = finishTime
        self.standardsID = standardsID
        self.wasScreened = wasScreened
        self.screenApertureID = screenApertureID
        self.oversizePulverizedSeparately = oversizePulverizedSeparately
        self.sampleChargeWeightGrams = sampleChargeWeightGrams
        self.pulverizerID = pulverizerID
        self.pulverizingDurationSeconds = pulverizingDurationSeconds
        self.divisionMethodID = divisionMethodID
        self.rsdNumberOfSegments = rsdNumberOfSegments
        self.incrementISOScoopUsed = incrementISOScoopUsed
        self.incrementBackingPlateUsed = incrementBackingPlateUsed
        self.incrementDividedToExtinction = incrementDividedToExtinction
        self.riffleApertureMillimetres = riffleApertureMillimetres
        self.numberOfSets = numberOfSets
        self.transparencyID = transparencyID
    }

    public init?(mutationRequest: SamplePreparationMutationRequest) {
        guard
            let preparationCompanyID = mutationRequest.preparationCompanyID,
            let siteID = mutationRequest.siteID,
            let location = mutationRequest.location,
            let startTime = mutationRequest.startTime,
            let finishTime = mutationRequest.finishTime,
            let standardsID = mutationRequest.standardsID,
            let wasScreened = mutationRequest.wasScreened,
            let screenApertureID = mutationRequest.screenApertureID,
            let oversizePulverizedSeparately = mutationRequest.oversizePulverizedSeparately,
            let sampleChargeWeightGrams = mutationRequest.sampleChargeWeightGrams,
            let pulverizerID = mutationRequest.pulverizerID,
            let pulverizingDurationSeconds = mutationRequest.pulverizingDurationSeconds,
            let divisionMethodID = mutationRequest.divisionMethodID,
            let rsdNumberOfSegments = mutationRequest.rsdNumberOfSegments,
            let incrementISOScoopUsed = mutationRequest.incrementISOScoopUsed,
            let incrementBackingPlateUsed = mutationRequest.incrementBackingPlateUsed,
            let incrementDividedToExtinction = mutationRequest.incrementDividedToExtinction,
            let riffleApertureMillimetres = mutationRequest.riffleApertureMillimetres,
            let numberOfSets = mutationRequest.numberOfSets,
            let transparencyID = mutationRequest.transparencyID
        else {
            return nil
        }

        self.preparationCompanyID = preparationCompanyID
        self.siteID = siteID
        self.location = location
        self.startTime = startTime
        self.finishTime = finishTime
        self.standardsID = standardsID
        self.wasScreened = wasScreened
        self.screenApertureID = screenApertureID
        self.oversizePulverizedSeparately = oversizePulverizedSeparately
        self.sampleChargeWeightGrams = sampleChargeWeightGrams
        self.pulverizerID = pulverizerID
        self.pulverizingDurationSeconds = pulverizingDurationSeconds
        self.divisionMethodID = divisionMethodID
        self.rsdNumberOfSegments = rsdNumberOfSegments
        self.incrementISOScoopUsed = incrementISOScoopUsed
        self.incrementBackingPlateUsed = incrementBackingPlateUsed
        self.incrementDividedToExtinction = incrementDividedToExtinction
        self.riffleApertureMillimetres = riffleApertureMillimetres
        self.numberOfSets = numberOfSets
        self.transparencyID = transparencyID
    }
}

// MARK: MutationRequest

public struct SamplePreparationMutationRequest: SamplePreparationPartialProperties, PartialMergable, MutationRequest, Codable, Hashable {
    public var preparationCompanyID: Int?
    public var siteID: Int?
    public var location: LocationDTO?
    public var startTime: Date?
    public var finishTime: Date?
    public var standardsID: Int?
    public var wasScreened: Bool?
    public var screenApertureID: Int??
    public var oversizePulverizedSeparately: Bool??
    public var sampleChargeWeightGrams: Int?
    public var pulverizerID: Int?
    public var pulverizingDurationSeconds: TimeInterval?
    public var divisionMethodID: Int?
    public var rsdNumberOfSegments: Int??
    public var incrementISOScoopUsed: Bool??
    public var incrementBackingPlateUsed: Bool??
    public var incrementDividedToExtinction: Bool??
    public var riffleApertureMillimetres: Int??
    public var numberOfSets: Int?
    public var transparencyID: Int?

    public init(
        preparationCompanyID: Int? = nil,
        siteID: Int? = nil,
        location: LocationDTO? = nil,
        startTime: Date? = nil,
        finishTime: Date? = nil,
        standardsID: Int? = nil,
        wasScreened: Bool? = nil,
        screenApertureID: Int?? = nil,
        oversizePulverizedSeparately: Bool?? = nil,
        sampleChargeWeightGrams: Int? = nil,
        pulverizerID: Int? = nil,
        pulverizingDurationSeconds: TimeInterval? = nil,
        divisionMethodID: Int? = nil,
        rsdNumberOfSegments: Int?? = nil,
        incrementISOScoopUsed: Bool?? = nil,
        incrementBackingPlateUsed: Bool?? = nil,
        incrementDividedToExtinction: Bool?? = nil,
        riffleApertureMillimetres: Int?? = nil,
        numberOfSets: Int? = nil,
        transparencyID: Int? = nil
    ) {
        self.preparationCompanyID = preparationCompanyID
        self.siteID = siteID
        self.location = location
        self.startTime = startTime
        self.finishTime = finishTime
        self.standardsID = standardsID
        self.wasScreened = wasScreened
        self.screenApertureID = screenApertureID
        self.oversizePulverizedSeparately = oversizePulverizedSeparately
        self.sampleChargeWeightGrams = sampleChargeWeightGrams
        self.pulverizerID = pulverizerID
        self.pulverizingDurationSeconds = pulverizingDurationSeconds
        self.divisionMethodID = divisionMethodID
        self.rsdNumberOfSegments = rsdNumberOfSegments
        self.incrementISOScoopUsed = incrementISOScoopUsed
        self.incrementBackingPlateUsed = incrementBackingPlateUsed
        self.incrementDividedToExtinction = incrementDividedToExtinction
        self.riffleApertureMillimetres = riffleApertureMillimetres
        self.numberOfSets = numberOfSets
        self.transparencyID = transparencyID
    }

    public init(keyAndValues: [String: Any]) {
        if let preparationCompanyID = keyAndValues["preparationCompanyID"] as? Int {
            self.preparationCompanyID = preparationCompanyID
        }
        if let siteID = keyAndValues["siteID"] as? Int {
            self.siteID = siteID
        }
        if let location = keyAndValues["location"] as? LocationDTO {
            self.location = location
        }
        if let startTime = keyAndValues["startTime"] as? Date {
            self.startTime = startTime
        }
        if let finishTime = keyAndValues["finishTime"] as? Date {
            self.finishTime = finishTime
        }
        if let standardsID = keyAndValues["standardsID"] as? Int {
            self.standardsID = standardsID
        }
        if let wasScreened = keyAndValues["wasScreened"] as? Bool {
            self.wasScreened = wasScreened
        }
        if let screenApertureID = keyAndValues["screenApertureID"] as? Int? {
            self.screenApertureID = screenApertureID
        }
        if let oversizePulverizedSeparately = keyAndValues["oversizePulverizedSeparately"] as? Bool? {
            self.oversizePulverizedSeparately = oversizePulverizedSeparately
        }
        if let sampleChargeWeightGrams = keyAndValues["sampleChargeWeightGrams"] as? Int {
            self.sampleChargeWeightGrams = sampleChargeWeightGrams
        }
        if let pulverizerID = keyAndValues["pulverizerID"] as? Int {
            self.pulverizerID = pulverizerID
        }
        if let pulverizingDurationSeconds = keyAndValues["pulverizingDurationSeconds"] as? TimeInterval {
            self.pulverizingDurationSeconds = pulverizingDurationSeconds
        }
        if let divisionMethodID = keyAndValues["divisionMethodID"] as? Int {
            self.divisionMethodID = divisionMethodID
        }
        if let rsdNumberOfSegments = keyAndValues["rsdNumberOfSegments"] as? Int? {
            self.rsdNumberOfSegments = rsdNumberOfSegments
        }
        if let incrementISOScoopUsed = keyAndValues["incrementISOScoopUsed"] as? Bool? {
            self.incrementISOScoopUsed = incrementISOScoopUsed
        }
        if let incrementBackingPlateUsed = keyAndValues["incrementBackingPlateUsed"] as? Bool? {
            self.incrementBackingPlateUsed = incrementBackingPlateUsed
        }
        if let incrementDividedToExtinction = keyAndValues["incrementDividedToExtinction"] as? Bool? {
            self.incrementDividedToExtinction = incrementDividedToExtinction
        }
        if let riffleApertureMillimetres = keyAndValues["riffleApertureMillimetres"] as? Int? {
            self.riffleApertureMillimetres = riffleApertureMillimetres
        }
        if let numberOfSets = keyAndValues["numberOfSets"] as? Int {
            self.numberOfSets = numberOfSets
        }
        if let transparencyID = keyAndValues["transparencyID"] as? Int {
            self.transparencyID = transparencyID
        }
    }

    public static func empty() -> Self { Self() }

    public mutating func merge(from other: Self) {
        if let updatedValue = other.preparationCompanyID {
            preparationCompanyID = updatedValue
        }
        if let updatedValue = other.siteID {
            siteID = updatedValue
        }
        if let updatedValue = other.location {
            location = updatedValue
        }
        if let updatedValue = other.startTime {
            startTime = updatedValue
        }
        if let updatedValue = other.finishTime {
            finishTime = updatedValue
        }
        if let updatedValue = other.standardsID {
            standardsID = updatedValue
        }
        if let updatedValue = other.wasScreened {
            wasScreened = updatedValue
        }
        if let updatedValue = other.screenApertureID {
            screenApertureID = updatedValue
        }
        if let updatedValue = other.oversizePulverizedSeparately {
            oversizePulverizedSeparately = updatedValue
        }
        if let updatedValue = other.sampleChargeWeightGrams {
            sampleChargeWeightGrams = updatedValue
        }
        if let updatedValue = other.pulverizerID {
            pulverizerID = updatedValue
        }
        if let updatedValue = other.pulverizingDurationSeconds {
            pulverizingDurationSeconds = updatedValue
        }
        if let updatedValue = other.divisionMethodID {
            divisionMethodID = updatedValue
        }
        if let updatedValue = other.rsdNumberOfSegments {
            rsdNumberOfSegments = updatedValue
        }
        if let updatedValue = other.incrementISOScoopUsed {
            incrementISOScoopUsed = updatedValue
        }
        if let updatedValue = other.incrementBackingPlateUsed {
            incrementBackingPlateUsed = updatedValue
        }
        if let updatedValue = other.incrementDividedToExtinction {
            incrementDividedToExtinction = updatedValue
        }
        if let updatedValue = other.riffleApertureMillimetres {
            riffleApertureMillimetres = updatedValue
        }
        if let updatedValue = other.numberOfSets {
            numberOfSets = updatedValue
        }
        if let updatedValue = other.transparencyID {
            transparencyID = updatedValue
        }
    }
}

// MARK: DTO

public struct SamplePreparationDTO: SamplePreparationProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
    public let preparationCompanyID: Int
    public let siteID: Int
    public let location: LocationDTO
    public let startTime: Date
    public let finishTime: Date
    public let standardsID: Int
    public let wasScreened: Bool
    public let screenApertureID: Int?
    public let oversizePulverizedSeparately: Bool?
    public let sampleChargeWeightGrams: Int
    public let pulverizerID: Int
    public let pulverizingDurationSeconds: TimeInterval
    public let divisionMethodID: Int
    public let rsdNumberOfSegments: Int?
    public let incrementISOScoopUsed: Bool?
    public let incrementBackingPlateUsed: Bool?
    public let incrementDividedToExtinction: Bool?
    public let riffleApertureMillimetres: Int?
    public let numberOfSets: Int
    public let transparencyID: Int

    public init(
        id: UUID,
        version: Date,
        preparationCompanyID: Int,
        siteID: Int,
        location: LocationDTO,
        startTime: Date,
        finishTime: Date,
        standardsID: Int,
        wasScreened: Bool,
        screenApertureID: Int?,
        oversizePulverizedSeparately: Bool?,
        sampleChargeWeightGrams: Int,
        pulverizerID: Int,
        pulverizingDurationSeconds: TimeInterval,
        divisionMethodID: Int,
        rsdNumberOfSegments: Int?,
        incrementISOScoopUsed: Bool?,
        incrementBackingPlateUsed: Bool?,
        incrementDividedToExtinction: Bool?,
        riffleApertureMillimetres: Int?,
        numberOfSets: Int,
        transparencyID: Int
    ) {
        self.id = id
        self.version = version
        self.preparationCompanyID = preparationCompanyID
        self.siteID = siteID
        self.location = location
        self.startTime = startTime
        self.finishTime = finishTime
        self.standardsID = standardsID
        self.wasScreened = wasScreened
        self.screenApertureID = screenApertureID
        self.oversizePulverizedSeparately = oversizePulverizedSeparately
        self.sampleChargeWeightGrams = sampleChargeWeightGrams
        self.pulverizerID = pulverizerID
        self.pulverizingDurationSeconds = pulverizingDurationSeconds
        self.divisionMethodID = divisionMethodID
        self.rsdNumberOfSegments = rsdNumberOfSegments
        self.incrementISOScoopUsed = incrementISOScoopUsed
        self.incrementBackingPlateUsed = incrementBackingPlateUsed
        self.incrementDividedToExtinction = incrementDividedToExtinction
        self.riffleApertureMillimetres = riffleApertureMillimetres
        self.numberOfSets = numberOfSets
        self.transparencyID = transparencyID
    }

    public init?(partial: PartialSamplePreparationDTO) {
        guard
            let preparationCompanyID = partial.preparationCompanyID,
            let siteID = partial.siteID,
            let location = partial.location,
            let startTime = partial.startTime,
            let finishTime = partial.finishTime,
            let standardsID = partial.standardsID,
            let wasScreened = partial.wasScreened,
            let screenApertureID = partial.screenApertureID,
            let oversizePulverizedSeparately = partial.oversizePulverizedSeparately,
            let sampleChargeWeightGrams = partial.sampleChargeWeightGrams,
            let pulverizerID = partial.pulverizerID,
            let pulverizingDurationSeconds = partial.pulverizingDurationSeconds,
            let divisionMethodID = partial.divisionMethodID,
            let rsdNumberOfSegments = partial.rsdNumberOfSegments,
            let incrementISOScoopUsed = partial.incrementISOScoopUsed,
            let incrementBackingPlateUsed = partial.incrementBackingPlateUsed,
            let incrementDividedToExtinction = partial.incrementDividedToExtinction,
            let riffleApertureMillimetres = partial.riffleApertureMillimetres,
            let numberOfSets = partial.numberOfSets,
            let transparencyID = partial.transparencyID
        else {
            return nil
        }

        self.id = partial.id
        self.version = partial.version
        self.preparationCompanyID = preparationCompanyID
        self.siteID = siteID
        self.location = location
        self.startTime = startTime
        self.finishTime = finishTime
        self.standardsID = standardsID
        self.wasScreened = wasScreened
        self.screenApertureID = screenApertureID
        self.oversizePulverizedSeparately = oversizePulverizedSeparately
        self.sampleChargeWeightGrams = sampleChargeWeightGrams
        self.pulverizerID = pulverizerID
        self.pulverizingDurationSeconds = pulverizingDurationSeconds
        self.divisionMethodID = divisionMethodID
        self.rsdNumberOfSegments = rsdNumberOfSegments
        self.incrementISOScoopUsed = incrementISOScoopUsed
        self.incrementBackingPlateUsed = incrementBackingPlateUsed
        self.incrementDividedToExtinction = incrementDividedToExtinction
        self.riffleApertureMillimetres = riffleApertureMillimetres
        self.numberOfSets = numberOfSets
        self.transparencyID = transparencyID
    }

    public init(
        _ creationRequest: SamplePreparationCreationRequest,
        id: UUID,
        version: Date
    ) {
        self.id = id
        self.version = version
        self.preparationCompanyID = creationRequest.preparationCompanyID
        self.siteID = creationRequest.siteID
        self.location = creationRequest.location
        self.startTime = creationRequest.startTime
        self.finishTime = creationRequest.finishTime
        self.standardsID = creationRequest.standardsID
        self.wasScreened = creationRequest.wasScreened
        self.screenApertureID = creationRequest.screenApertureID
        self.oversizePulverizedSeparately = creationRequest.oversizePulverizedSeparately
        self.sampleChargeWeightGrams = creationRequest.sampleChargeWeightGrams
        self.pulverizerID = creationRequest.pulverizerID
        self.pulverizingDurationSeconds = creationRequest.pulverizingDurationSeconds
        self.divisionMethodID = creationRequest.divisionMethodID
        self.rsdNumberOfSegments = creationRequest.rsdNumberOfSegments
        self.incrementISOScoopUsed = creationRequest.incrementISOScoopUsed
        self.incrementBackingPlateUsed = creationRequest.incrementBackingPlateUsed
        self.incrementDividedToExtinction = creationRequest.incrementDividedToExtinction
        self.riffleApertureMillimetres = creationRequest.riffleApertureMillimetres
        self.numberOfSets = creationRequest.numberOfSets
        self.transparencyID = creationRequest.transparencyID
    }
}

// MARK: PartialDTO

public struct PartialSamplePreparationDTO: SamplePreparationPartialProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
    public let preparationCompanyID: Int?
    public let siteID: Int?
    public let location: LocationDTO?
    public let startTime: Date?
    public let finishTime: Date?
    public let standardsID: Int?
    public let wasScreened: Bool?
    public let screenApertureID: Int??
    public let oversizePulverizedSeparately: Bool??
    public let sampleChargeWeightGrams: Int?
    public let pulverizerID: Int?
    public let pulverizingDurationSeconds: TimeInterval?
    public let divisionMethodID: Int?
    public let rsdNumberOfSegments: Int??
    public let incrementISOScoopUsed: Bool??
    public let incrementBackingPlateUsed: Bool??
    public let incrementDividedToExtinction: Bool??
    public let riffleApertureMillimetres: Int??
    public let numberOfSets: Int?
    public let transparencyID: Int?

    public init(
        id: UUID,
        version: Date,
        preparationCompanyID: Int? = nil,
        siteID: Int? = nil,
        location: LocationDTO? = nil,
        startTime: Date? = nil,
        finishTime: Date? = nil,
        standardsID: Int? = nil,
        wasScreened: Bool? = nil,
        screenApertureID: Int?? = nil,
        oversizePulverizedSeparately: Bool?? = nil,
        sampleChargeWeightGrams: Int? = nil,
        pulverizerID: Int? = nil,
        pulverizingDurationSeconds: TimeInterval? = nil,
        divisionMethodID: Int? = nil,
        rsdNumberOfSegments: Int?? = nil,
        incrementISOScoopUsed: Bool?? = nil,
        incrementBackingPlateUsed: Bool?? = nil,
        incrementDividedToExtinction: Bool?? = nil,
        riffleApertureMillimetres: Int?? = nil,
        numberOfSets: Int? = nil,
        transparencyID: Int? = nil
    ) {
        self.id = id
        self.version = version
        self.preparationCompanyID = preparationCompanyID
        self.siteID = siteID
        self.location = location
        self.startTime = startTime
        self.finishTime = finishTime
        self.standardsID = standardsID
        self.wasScreened = wasScreened
        self.screenApertureID = screenApertureID
        self.oversizePulverizedSeparately = oversizePulverizedSeparately
        self.sampleChargeWeightGrams = sampleChargeWeightGrams
        self.pulverizerID = pulverizerID
        self.pulverizingDurationSeconds = pulverizingDurationSeconds
        self.divisionMethodID = divisionMethodID
        self.rsdNumberOfSegments = rsdNumberOfSegments
        self.incrementISOScoopUsed = incrementISOScoopUsed
        self.incrementBackingPlateUsed = incrementBackingPlateUsed
        self.incrementDividedToExtinction = incrementDividedToExtinction
        self.riffleApertureMillimetres = riffleApertureMillimetres
        self.numberOfSets = numberOfSets
        self.transparencyID = transparencyID
    }

    public init(
        _ other: SamplePreparationMutationRequest,
        id: UUID,
        version: Date
    ) {
        self.id = id
        self.version = version
        self.preparationCompanyID = other.preparationCompanyID
        self.siteID = other.siteID
        self.location = other.location
        self.startTime = other.startTime
        self.finishTime = other.finishTime
        self.standardsID = other.standardsID
        self.wasScreened = other.wasScreened
        self.screenApertureID = other.screenApertureID
        self.oversizePulverizedSeparately = other.oversizePulverizedSeparately
        self.sampleChargeWeightGrams = other.sampleChargeWeightGrams
        self.pulverizerID = other.pulverizerID
        self.pulverizingDurationSeconds = other.pulverizingDurationSeconds
        self.divisionMethodID = other.divisionMethodID
        self.rsdNumberOfSegments = other.rsdNumberOfSegments
        self.incrementISOScoopUsed = other.incrementISOScoopUsed
        self.incrementBackingPlateUsed = other.incrementBackingPlateUsed
        self.incrementDividedToExtinction = other.incrementDividedToExtinction
        self.riffleApertureMillimetres = other.riffleApertureMillimetres
        self.numberOfSets = other.numberOfSets
        self.transparencyID = other.transparencyID
    }
}

// MARK: - SampleReduction

// MARK: Protocol

public protocol SampleReductionProperties {
    var samplingCompanyID: Int { get }
    var location: LocationDTO { get }
    var siteID: Int { get }
    var laboratoryID: Int? { get }
    var reductionPointID: Int { get }
    var startTime: Date { get }
    var finishTime: Date { get }
    var screenApertureMillimetres: Double? { get }
    var wasConedAndQuartered: Bool { get }
    var methodID: Int { get }
    var gridSizeID: Int? { get }
}

public protocol SampleReductionPartialProperties {
    var samplingCompanyID: Int? { get }
    var location: LocationDTO? { get }
    var siteID: Int? { get }
    var laboratoryID: Int?? { get }
    var reductionPointID: Int? { get }
    var startTime: Date? { get }
    var finishTime: Date? { get }
    var screenApertureMillimetres: Double?? { get }
    var wasConedAndQuartered: Bool? { get }
    var methodID: Int? { get }
    var gridSizeID: Int?? { get }
}

// MARK: CreationRequest

public struct SampleReductionCreationRequest: SampleReductionProperties, Codable, Hashable {
    public var samplingCompanyID: Int
    public var location: LocationDTO
    public var siteID: Int
    public var laboratoryID: Int?
    public var reductionPointID: Int
    public var startTime: Date
    public var finishTime: Date
    public var screenApertureMillimetres: Double?
    public var wasConedAndQuartered: Bool
    public var methodID: Int
    public var gridSizeID: Int?

    public init(
        samplingCompanyID: Int,
        location: LocationDTO,
        siteID: Int,
        laboratoryID: Int?,
        reductionPointID: Int,
        startTime: Date,
        finishTime: Date,
        screenApertureMillimetres: Double?,
        wasConedAndQuartered: Bool,
        methodID: Int,
        gridSizeID: Int?
    ) {
        self.samplingCompanyID = samplingCompanyID
        self.location = location
        self.siteID = siteID
        self.laboratoryID = laboratoryID
        self.reductionPointID = reductionPointID
        self.startTime = startTime
        self.finishTime = finishTime
        self.screenApertureMillimetres = screenApertureMillimetres
        self.wasConedAndQuartered = wasConedAndQuartered
        self.methodID = methodID
        self.gridSizeID = gridSizeID
    }

    public init?(mutationRequest: SampleReductionMutationRequest) {
        guard
            let samplingCompanyID = mutationRequest.samplingCompanyID,
            let location = mutationRequest.location,
            let siteID = mutationRequest.siteID,
            let laboratoryID = mutationRequest.laboratoryID,
            let reductionPointID = mutationRequest.reductionPointID,
            let startTime = mutationRequest.startTime,
            let finishTime = mutationRequest.finishTime,
            let screenApertureMillimetres = mutationRequest.screenApertureMillimetres,
            let wasConedAndQuartered = mutationRequest.wasConedAndQuartered,
            let methodID = mutationRequest.methodID,
            let gridSizeID = mutationRequest.gridSizeID
        else {
            return nil
        }

        self.samplingCompanyID = samplingCompanyID
        self.location = location
        self.siteID = siteID
        self.laboratoryID = laboratoryID
        self.reductionPointID = reductionPointID
        self.startTime = startTime
        self.finishTime = finishTime
        self.screenApertureMillimetres = screenApertureMillimetres
        self.wasConedAndQuartered = wasConedAndQuartered
        self.methodID = methodID
        self.gridSizeID = gridSizeID
    }
}

// MARK: MutationRequest

public struct SampleReductionMutationRequest: SampleReductionPartialProperties, PartialMergable, MutationRequest, Codable, Hashable {
    public var samplingCompanyID: Int?
    public var location: LocationDTO?
    public var siteID: Int?
    public var laboratoryID: Int??
    public var reductionPointID: Int?
    public var startTime: Date?
    public var finishTime: Date?
    public var screenApertureMillimetres: Double??
    public var wasConedAndQuartered: Bool?
    public var methodID: Int?
    public var gridSizeID: Int??

    public init(
        samplingCompanyID: Int? = nil,
        location: LocationDTO? = nil,
        siteID: Int? = nil,
        laboratoryID: Int?? = nil,
        reductionPointID: Int? = nil,
        startTime: Date? = nil,
        finishTime: Date? = nil,
        screenApertureMillimetres: Double?? = nil,
        wasConedAndQuartered: Bool? = nil,
        methodID: Int? = nil,
        gridSizeID: Int?? = nil
    ) {
        self.samplingCompanyID = samplingCompanyID
        self.location = location
        self.siteID = siteID
        self.laboratoryID = laboratoryID
        self.reductionPointID = reductionPointID
        self.startTime = startTime
        self.finishTime = finishTime
        self.screenApertureMillimetres = screenApertureMillimetres
        self.wasConedAndQuartered = wasConedAndQuartered
        self.methodID = methodID
        self.gridSizeID = gridSizeID
    }

    public init(keyAndValues: [String: Any]) {
        if let samplingCompanyID = keyAndValues["samplingCompanyID"] as? Int {
            self.samplingCompanyID = samplingCompanyID
        }
        if let location = keyAndValues["location"] as? LocationDTO {
            self.location = location
        }
        if let siteID = keyAndValues["siteID"] as? Int {
            self.siteID = siteID
        }
        if let laboratoryID = keyAndValues["laboratoryID"] as? Int? {
            self.laboratoryID = laboratoryID
        }
        if let reductionPointID = keyAndValues["reductionPointID"] as? Int {
            self.reductionPointID = reductionPointID
        }
        if let startTime = keyAndValues["startTime"] as? Date {
            self.startTime = startTime
        }
        if let finishTime = keyAndValues["finishTime"] as? Date {
            self.finishTime = finishTime
        }
        if let screenApertureMillimetres = keyAndValues["screenApertureMillimetres"] as? Double? {
            self.screenApertureMillimetres = screenApertureMillimetres
        }
        if let wasConedAndQuartered = keyAndValues["wasConedAndQuartered"] as? Bool {
            self.wasConedAndQuartered = wasConedAndQuartered
        }
        if let methodID = keyAndValues["methodID"] as? Int {
            self.methodID = methodID
        }
        if let gridSizeID = keyAndValues["gridSizeID"] as? Int? {
            self.gridSizeID = gridSizeID
        }
    }

    public static func empty() -> Self { Self() }

    public mutating func merge(from other: Self) {
        if let updatedValue = other.samplingCompanyID {
            samplingCompanyID = updatedValue
        }
        if let updatedValue = other.location {
            location = updatedValue
        }
        if let updatedValue = other.siteID {
            siteID = updatedValue
        }
        if let updatedValue = other.laboratoryID {
            laboratoryID = updatedValue
        }
        if let updatedValue = other.reductionPointID {
            reductionPointID = updatedValue
        }
        if let updatedValue = other.startTime {
            startTime = updatedValue
        }
        if let updatedValue = other.finishTime {
            finishTime = updatedValue
        }
        if let updatedValue = other.screenApertureMillimetres {
            screenApertureMillimetres = updatedValue
        }
        if let updatedValue = other.wasConedAndQuartered {
            wasConedAndQuartered = updatedValue
        }
        if let updatedValue = other.methodID {
            methodID = updatedValue
        }
        if let updatedValue = other.gridSizeID {
            gridSizeID = updatedValue
        }
    }
}

// MARK: DTO

public struct SampleReductionDTO: SampleReductionProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
    public let samplingCompanyID: Int
    public let location: LocationDTO
    public let siteID: Int
    public let laboratoryID: Int?
    public let reductionPointID: Int
    public let startTime: Date
    public let finishTime: Date
    public let screenApertureMillimetres: Double?
    public let wasConedAndQuartered: Bool
    public let methodID: Int
    public let gridSizeID: Int?

    public init(
        id: UUID,
        version: Date,
        samplingCompanyID: Int,
        location: LocationDTO,
        siteID: Int,
        laboratoryID: Int?,
        reductionPointID: Int,
        startTime: Date,
        finishTime: Date,
        screenApertureMillimetres: Double?,
        wasConedAndQuartered: Bool,
        methodID: Int,
        gridSizeID: Int?
    ) {
        self.id = id
        self.version = version
        self.samplingCompanyID = samplingCompanyID
        self.location = location
        self.siteID = siteID
        self.laboratoryID = laboratoryID
        self.reductionPointID = reductionPointID
        self.startTime = startTime
        self.finishTime = finishTime
        self.screenApertureMillimetres = screenApertureMillimetres
        self.wasConedAndQuartered = wasConedAndQuartered
        self.methodID = methodID
        self.gridSizeID = gridSizeID
    }

    public init?(partial: PartialSampleReductionDTO) {
        guard
            let samplingCompanyID = partial.samplingCompanyID,
            let location = partial.location,
            let siteID = partial.siteID,
            let laboratoryID = partial.laboratoryID,
            let reductionPointID = partial.reductionPointID,
            let startTime = partial.startTime,
            let finishTime = partial.finishTime,
            let screenApertureMillimetres = partial.screenApertureMillimetres,
            let wasConedAndQuartered = partial.wasConedAndQuartered,
            let methodID = partial.methodID,
            let gridSizeID = partial.gridSizeID
        else {
            return nil
        }

        self.id = partial.id
        self.version = partial.version
        self.samplingCompanyID = samplingCompanyID
        self.location = location
        self.siteID = siteID
        self.laboratoryID = laboratoryID
        self.reductionPointID = reductionPointID
        self.startTime = startTime
        self.finishTime = finishTime
        self.screenApertureMillimetres = screenApertureMillimetres
        self.wasConedAndQuartered = wasConedAndQuartered
        self.methodID = methodID
        self.gridSizeID = gridSizeID
    }

    public init(
        _ creationRequest: SampleReductionCreationRequest,
        id: UUID,
        version: Date
    ) {
        self.id = id
        self.version = version
        self.samplingCompanyID = creationRequest.samplingCompanyID
        self.location = creationRequest.location
        self.siteID = creationRequest.siteID
        self.laboratoryID = creationRequest.laboratoryID
        self.reductionPointID = creationRequest.reductionPointID
        self.startTime = creationRequest.startTime
        self.finishTime = creationRequest.finishTime
        self.screenApertureMillimetres = creationRequest.screenApertureMillimetres
        self.wasConedAndQuartered = creationRequest.wasConedAndQuartered
        self.methodID = creationRequest.methodID
        self.gridSizeID = creationRequest.gridSizeID
    }
}

// MARK: PartialDTO

public struct PartialSampleReductionDTO: SampleReductionPartialProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
    public let samplingCompanyID: Int?
    public let location: LocationDTO?
    public let siteID: Int?
    public let laboratoryID: Int??
    public let reductionPointID: Int?
    public let startTime: Date?
    public let finishTime: Date?
    public let screenApertureMillimetres: Double??
    public let wasConedAndQuartered: Bool?
    public let methodID: Int?
    public let gridSizeID: Int??

    public init(
        id: UUID,
        version: Date,
        samplingCompanyID: Int? = nil,
        location: LocationDTO? = nil,
        siteID: Int? = nil,
        laboratoryID: Int?? = nil,
        reductionPointID: Int? = nil,
        startTime: Date? = nil,
        finishTime: Date? = nil,
        screenApertureMillimetres: Double?? = nil,
        wasConedAndQuartered: Bool? = nil,
        methodID: Int? = nil,
        gridSizeID: Int?? = nil
    ) {
        self.id = id
        self.version = version
        self.samplingCompanyID = samplingCompanyID
        self.location = location
        self.siteID = siteID
        self.laboratoryID = laboratoryID
        self.reductionPointID = reductionPointID
        self.startTime = startTime
        self.finishTime = finishTime
        self.screenApertureMillimetres = screenApertureMillimetres
        self.wasConedAndQuartered = wasConedAndQuartered
        self.methodID = methodID
        self.gridSizeID = gridSizeID
    }

    public init(
        _ other: SampleReductionMutationRequest,
        id: UUID,
        version: Date
    ) {
        self.id = id
        self.version = version
        self.samplingCompanyID = other.samplingCompanyID
        self.location = other.location
        self.siteID = other.siteID
        self.laboratoryID = other.laboratoryID
        self.reductionPointID = other.reductionPointID
        self.startTime = other.startTime
        self.finishTime = other.finishTime
        self.screenApertureMillimetres = other.screenApertureMillimetres
        self.wasConedAndQuartered = other.wasConedAndQuartered
        self.methodID = other.methodID
        self.gridSizeID = other.gridSizeID
    }
}

// MARK: - ShipmentDetails

// MARK: Protocol

public protocol ShipmentDetailsProperties {
    var clientReference: String { get }
    var logDate: Date { get }
    var norTime: Date { get }
    var vesselName: String { get }
    var clientID: Int { get }
    var commodityID: Int { get }
    var agentID: Int? { get }
    var traderID: Int? { get }
    var smelterID: Int { get }
    var dischargePortID: Int { get }
    var inspectionCompanyReceiverID: Int? { get }
    var inspectionCompanySellerID: Int? { get }
    var inspectionCompanySecondAgentID: Int? { get }
    var conradTeamSize: Int { get }
}

public protocol ShipmentDetailsPartialProperties {
    var clientReference: String? { get }
    var logDate: Date? { get }
    var norTime: Date? { get }
    var vesselName: String? { get }
    var clientID: Int? { get }
    var commodityID: Int? { get }
    var agentID: Int?? { get }
    var traderID: Int?? { get }
    var smelterID: Int? { get }
    var dischargePortID: Int? { get }
    var inspectionCompanyReceiverID: Int?? { get }
    var inspectionCompanySellerID: Int?? { get }
    var inspectionCompanySecondAgentID: Int?? { get }
    var conradTeamSize: Int? { get }
}

// MARK: CreationRequest

public struct ShipmentCreationRequest: ShipmentDetailsProperties, Codable, Hashable {
    public var clientReference: String
    public var logDate: Date
    public var norTime: Date
    public var vesselName: String
    public var clientID: Int
    public var commodityID: Int
    public var agentID: Int?
    public var traderID: Int?
    public var smelterID: Int
    public var dischargePortID: Int
    public var inspectionCompanyReceiverID: Int?
    public var inspectionCompanySellerID: Int?
    public var inspectionCompanySecondAgentID: Int?
    public var conradTeamSize: Int

    public init(
        clientReference: String,
        logDate: Date,
        norTime: Date,
        vesselName: String,
        clientID: Int,
        commodityID: Int,
        agentID: Int?,
        traderID: Int?,
        smelterID: Int,
        dischargePortID: Int,
        inspectionCompanyReceiverID: Int?,
        inspectionCompanySellerID: Int?,
        inspectionCompanySecondAgentID: Int?,
        conradTeamSize: Int
    ) {
        self.clientReference = clientReference
        self.logDate = logDate
        self.norTime = norTime
        self.vesselName = vesselName
        self.clientID = clientID
        self.commodityID = commodityID
        self.agentID = agentID
        self.traderID = traderID
        self.smelterID = smelterID
        self.dischargePortID = dischargePortID
        self.inspectionCompanyReceiverID = inspectionCompanyReceiverID
        self.inspectionCompanySellerID = inspectionCompanySellerID
        self.inspectionCompanySecondAgentID = inspectionCompanySecondAgentID
        self.conradTeamSize = conradTeamSize
    }

    public init?(mutationRequest: ShipmentDetailsMutationRequest) {
        guard
            let clientReference = mutationRequest.clientReference,
            let logDate = mutationRequest.logDate,
            let norTime = mutationRequest.norTime,
            let vesselName = mutationRequest.vesselName,
            let clientID = mutationRequest.clientID,
            let commodityID = mutationRequest.commodityID,
            let agentID = mutationRequest.agentID,
            let traderID = mutationRequest.traderID,
            let smelterID = mutationRequest.smelterID,
            let dischargePortID = mutationRequest.dischargePortID,
            let inspectionCompanyReceiverID = mutationRequest.inspectionCompanyReceiverID,
            let inspectionCompanySellerID = mutationRequest.inspectionCompanySellerID,
            let inspectionCompanySecondAgentID = mutationRequest.inspectionCompanySecondAgentID,
            let conradTeamSize = mutationRequest.conradTeamSize
        else {
            return nil
        }

        self.clientReference = clientReference
        self.logDate = logDate
        self.norTime = norTime
        self.vesselName = vesselName
        self.clientID = clientID
        self.commodityID = commodityID
        self.agentID = agentID
        self.traderID = traderID
        self.smelterID = smelterID
        self.dischargePortID = dischargePortID
        self.inspectionCompanyReceiverID = inspectionCompanyReceiverID
        self.inspectionCompanySellerID = inspectionCompanySellerID
        self.inspectionCompanySecondAgentID = inspectionCompanySecondAgentID
        self.conradTeamSize = conradTeamSize
    }
}

// MARK: MutationRequest

public struct ShipmentDetailsMutationRequest: ShipmentDetailsPartialProperties, PartialMergable, MutationRequest, Codable, Hashable {
    public var clientReference: String?
    public var logDate: Date?
    public var norTime: Date?
    public var vesselName: String?
    public var clientID: Int?
    public var commodityID: Int?
    public var agentID: Int??
    public var traderID: Int??
    public var smelterID: Int?
    public var dischargePortID: Int?
    public var inspectionCompanyReceiverID: Int??
    public var inspectionCompanySellerID: Int??
    public var inspectionCompanySecondAgentID: Int??
    public var conradTeamSize: Int?

    public init(
        clientReference: String? = nil,
        logDate: Date? = nil,
        norTime: Date? = nil,
        vesselName: String? = nil,
        clientID: Int? = nil,
        commodityID: Int? = nil,
        agentID: Int?? = nil,
        traderID: Int?? = nil,
        smelterID: Int? = nil,
        dischargePortID: Int? = nil,
        inspectionCompanyReceiverID: Int?? = nil,
        inspectionCompanySellerID: Int?? = nil,
        inspectionCompanySecondAgentID: Int?? = nil,
        conradTeamSize: Int? = nil
    ) {
        self.clientReference = clientReference
        self.logDate = logDate
        self.norTime = norTime
        self.vesselName = vesselName
        self.clientID = clientID
        self.commodityID = commodityID
        self.agentID = agentID
        self.traderID = traderID
        self.smelterID = smelterID
        self.dischargePortID = dischargePortID
        self.inspectionCompanyReceiverID = inspectionCompanyReceiverID
        self.inspectionCompanySellerID = inspectionCompanySellerID
        self.inspectionCompanySecondAgentID = inspectionCompanySecondAgentID
        self.conradTeamSize = conradTeamSize
    }

    public init(keyAndValues: [String: Any]) {
        if let clientReference = keyAndValues["clientReference"] as? String {
            self.clientReference = clientReference
        }
        if let logDate = keyAndValues["logDate"] as? Date {
            self.logDate = logDate
        }
        if let norTime = keyAndValues["norTime"] as? Date {
            self.norTime = norTime
        }
        if let vesselName = keyAndValues["vesselName"] as? String {
            self.vesselName = vesselName
        }
        if let clientID = keyAndValues["clientID"] as? Int {
            self.clientID = clientID
        }
        if let commodityID = keyAndValues["commodityID"] as? Int {
            self.commodityID = commodityID
        }
        if let agentID = keyAndValues["agentID"] as? Int? {
            self.agentID = agentID
        }
        if let traderID = keyAndValues["traderID"] as? Int? {
            self.traderID = traderID
        }
        if let smelterID = keyAndValues["smelterID"] as? Int {
            self.smelterID = smelterID
        }
        if let dischargePortID = keyAndValues["dischargePortID"] as? Int {
            self.dischargePortID = dischargePortID
        }
        if let inspectionCompanyReceiverID = keyAndValues["inspectionCompanyReceiverID"] as? Int? {
            self.inspectionCompanyReceiverID = inspectionCompanyReceiverID
        }
        if let inspectionCompanySellerID = keyAndValues["inspectionCompanySellerID"] as? Int? {
            self.inspectionCompanySellerID = inspectionCompanySellerID
        }
        if let inspectionCompanySecondAgentID = keyAndValues["inspectionCompanySecondAgentID"] as? Int? {
            self.inspectionCompanySecondAgentID = inspectionCompanySecondAgentID
        }
        if let conradTeamSize = keyAndValues["conradTeamSize"] as? Int {
            self.conradTeamSize = conradTeamSize
        }
    }

    public static func empty() -> Self { Self() }

    public mutating func merge(from other: Self) {
        if let updatedValue = other.clientReference {
            clientReference = updatedValue
        }
        if let updatedValue = other.logDate {
            logDate = updatedValue
        }
        if let updatedValue = other.norTime {
            norTime = updatedValue
        }
        if let updatedValue = other.vesselName {
            vesselName = updatedValue
        }
        if let updatedValue = other.clientID {
            clientID = updatedValue
        }
        if let updatedValue = other.commodityID {
            commodityID = updatedValue
        }
        if let updatedValue = other.agentID {
            agentID = updatedValue
        }
        if let updatedValue = other.traderID {
            traderID = updatedValue
        }
        if let updatedValue = other.smelterID {
            smelterID = updatedValue
        }
        if let updatedValue = other.dischargePortID {
            dischargePortID = updatedValue
        }
        if let updatedValue = other.inspectionCompanyReceiverID {
            inspectionCompanyReceiverID = updatedValue
        }
        if let updatedValue = other.inspectionCompanySellerID {
            inspectionCompanySellerID = updatedValue
        }
        if let updatedValue = other.inspectionCompanySecondAgentID {
            inspectionCompanySecondAgentID = updatedValue
        }
        if let updatedValue = other.conradTeamSize {
            conradTeamSize = updatedValue
        }
    }
}

// MARK: DTO

public struct ShipmentDetailsDTO: ShipmentDetailsProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
    public let creationDate: Date
    public let clientReference: String
    public let logDate: Date
    public let norTime: Date
    public let vesselName: String
    public let clientID: Int
    public let commodityID: Int
    public let agentID: Int?
    public let traderID: Int?
    public let smelterID: Int
    public let dischargePortID: Int
    public let inspectionCompanyReceiverID: Int?
    public let inspectionCompanySellerID: Int?
    public let inspectionCompanySecondAgentID: Int?
    public let conradTeamSize: Int

    public init(
        id: UUID,
        version: Date,
        creationDate: Date,
        clientReference: String,
        logDate: Date,
        norTime: Date,
        vesselName: String,
        clientID: Int,
        commodityID: Int,
        agentID: Int?,
        traderID: Int?,
        smelterID: Int,
        dischargePortID: Int,
        inspectionCompanyReceiverID: Int?,
        inspectionCompanySellerID: Int?,
        inspectionCompanySecondAgentID: Int?,
        conradTeamSize: Int
    ) {
        self.id = id
        self.version = version
        self.creationDate = creationDate
        self.clientReference = clientReference
        self.logDate = logDate
        self.norTime = norTime
        self.vesselName = vesselName
        self.clientID = clientID
        self.commodityID = commodityID
        self.agentID = agentID
        self.traderID = traderID
        self.smelterID = smelterID
        self.dischargePortID = dischargePortID
        self.inspectionCompanyReceiverID = inspectionCompanyReceiverID
        self.inspectionCompanySellerID = inspectionCompanySellerID
        self.inspectionCompanySecondAgentID = inspectionCompanySecondAgentID
        self.conradTeamSize = conradTeamSize
    }

    public init?(partial: PartialShipmentDetailsDTO) {
        guard
            let creationDate = partial.creationDate,
            let clientReference = partial.clientReference,
            let logDate = partial.logDate,
            let norTime = partial.norTime,
            let vesselName = partial.vesselName,
            let clientID = partial.clientID,
            let commodityID = partial.commodityID,
            let agentID = partial.agentID,
            let traderID = partial.traderID,
            let smelterID = partial.smelterID,
            let dischargePortID = partial.dischargePortID,
            let inspectionCompanyReceiverID = partial.inspectionCompanyReceiverID,
            let inspectionCompanySellerID = partial.inspectionCompanySellerID,
            let inspectionCompanySecondAgentID = partial.inspectionCompanySecondAgentID,
            let conradTeamSize = partial.conradTeamSize
        else {
            return nil
        }

        self.id = partial.id
        self.version = partial.version
        self.creationDate = creationDate
        self.clientReference = clientReference
        self.logDate = logDate
        self.norTime = norTime
        self.vesselName = vesselName
        self.clientID = clientID
        self.commodityID = commodityID
        self.agentID = agentID
        self.traderID = traderID
        self.smelterID = smelterID
        self.dischargePortID = dischargePortID
        self.inspectionCompanyReceiverID = inspectionCompanyReceiverID
        self.inspectionCompanySellerID = inspectionCompanySellerID
        self.inspectionCompanySecondAgentID = inspectionCompanySecondAgentID
        self.conradTeamSize = conradTeamSize
    }

    public init(
        _ creationRequest: ShipmentCreationRequest,
        id: UUID,
        version: Date,
        creationDate: Date
    ) {
        self.id = id
        self.version = version
        self.creationDate = creationDate
        self.clientReference = creationRequest.clientReference
        self.logDate = creationRequest.logDate
        self.norTime = creationRequest.norTime
        self.vesselName = creationRequest.vesselName
        self.clientID = creationRequest.clientID
        self.commodityID = creationRequest.commodityID
        self.agentID = creationRequest.agentID
        self.traderID = creationRequest.traderID
        self.smelterID = creationRequest.smelterID
        self.dischargePortID = creationRequest.dischargePortID
        self.inspectionCompanyReceiverID = creationRequest.inspectionCompanyReceiverID
        self.inspectionCompanySellerID = creationRequest.inspectionCompanySellerID
        self.inspectionCompanySecondAgentID = creationRequest.inspectionCompanySecondAgentID
        self.conradTeamSize = creationRequest.conradTeamSize
    }
}

// MARK: PartialDTO

public struct PartialShipmentDetailsDTO: ShipmentDetailsPartialProperties, Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
    public let creationDate: Date?
    public let clientReference: String?
    public let logDate: Date?
    public let norTime: Date?
    public let vesselName: String?
    public let clientID: Int?
    public let commodityID: Int?
    public let agentID: Int??
    public let traderID: Int??
    public let smelterID: Int?
    public let dischargePortID: Int?
    public let inspectionCompanyReceiverID: Int??
    public let inspectionCompanySellerID: Int??
    public let inspectionCompanySecondAgentID: Int??
    public let conradTeamSize: Int?

    public init(
        id: UUID,
        version: Date,
        creationDate: Date? = nil,
        clientReference: String? = nil,
        logDate: Date? = nil,
        norTime: Date? = nil,
        vesselName: String? = nil,
        clientID: Int? = nil,
        commodityID: Int? = nil,
        agentID: Int?? = nil,
        traderID: Int?? = nil,
        smelterID: Int? = nil,
        dischargePortID: Int? = nil,
        inspectionCompanyReceiverID: Int?? = nil,
        inspectionCompanySellerID: Int?? = nil,
        inspectionCompanySecondAgentID: Int?? = nil,
        conradTeamSize: Int? = nil
    ) {
        self.id = id
        self.version = version
        self.creationDate = creationDate
        self.clientReference = clientReference
        self.logDate = logDate
        self.norTime = norTime
        self.vesselName = vesselName
        self.clientID = clientID
        self.commodityID = commodityID
        self.agentID = agentID
        self.traderID = traderID
        self.smelterID = smelterID
        self.dischargePortID = dischargePortID
        self.inspectionCompanyReceiverID = inspectionCompanyReceiverID
        self.inspectionCompanySellerID = inspectionCompanySellerID
        self.inspectionCompanySecondAgentID = inspectionCompanySecondAgentID
        self.conradTeamSize = conradTeamSize
    }

    public init(
        _ other: ShipmentDetailsMutationRequest,
        id: UUID,
        version: Date,
        creationDate: Date
    ) {
        self.id = id
        self.version = version
        self.creationDate = creationDate
        self.clientReference = other.clientReference
        self.logDate = other.logDate
        self.norTime = other.norTime
        self.vesselName = other.vesselName
        self.clientID = other.clientID
        self.commodityID = other.commodityID
        self.agentID = other.agentID
        self.traderID = other.traderID
        self.smelterID = other.smelterID
        self.dischargePortID = other.dischargePortID
        self.inspectionCompanyReceiverID = other.inspectionCompanyReceiverID
        self.inspectionCompanySellerID = other.inspectionCompanySellerID
        self.inspectionCompanySecondAgentID = other.inspectionCompanySecondAgentID
        self.conradTeamSize = other.conradTeamSize
    }
}

//
//

// MARK: - Constants

//
//

public protocol ConfigurationConstantValue: Codable, Identifiable where ID == Int {
    var id: ID { get }
    var value: String { get }
    var representsOtherValue: Bool { get }
    var isDeleted: Bool { get }

    init?(keyAndValues: [String: Any])
    func dictionaryValue() -> [String: Any]
}

public protocol SimpleConfigurationConstantValue: ConfigurationConstantValue {
    init(id: ID, value: String, representsOtherValue: Bool, isDeleted: Bool)
}

public struct AgentValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct ClientValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct CommodityValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct DischargeGearValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct DischargeMethodValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct DischargeWeatherConditionValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct DischargeWeightWeighingPointValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct InspectionCompanyValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct MaritimePortValue: ConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var countryCode: String
    public var timeZoneIdentifier: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        countryCode: String,
        timeZoneIdentifier: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.countryCode = countryCode
        self.timeZoneIdentifier = timeZoneIdentifier
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let countryCode = keyAndValues["countryCode"] as? String,
            let timeZoneIdentifier = keyAndValues["timeZoneIdentifier"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.countryCode = countryCode
        self.timeZoneIdentifier = timeZoneIdentifier
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "countryCode": countryCode,
            "timeZoneIdentifier": timeZoneIdentifier,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct SampleCollectionMethodValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct SampleCollectionPointValue: ConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var isFromTruck: Bool
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        isFromTruck: Bool,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.isFromTruck = isFromTruck
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let isFromTruck = keyAndValues["isFromTruck"] as? Bool,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.isFromTruck = isFromTruck
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "isFromTruck": isFromTruck,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct SamplePreparationDivisionMethodValue: ConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var usesRotarySampleDivider: Bool
    public var usesRiffle: Bool
    public var usesIncrementDivision: Bool
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        usesRotarySampleDivider: Bool,
        usesRiffle: Bool,
        usesIncrementDivision: Bool,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.usesRotarySampleDivider = usesRotarySampleDivider
        self.usesRiffle = usesRiffle
        self.usesIncrementDivision = usesIncrementDivision
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let usesRotarySampleDivider = keyAndValues["usesRotarySampleDivider"] as? Bool,
            let usesRiffle = keyAndValues["usesRiffle"] as? Bool,
            let usesIncrementDivision = keyAndValues["usesIncrementDivision"] as? Bool,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.usesRotarySampleDivider = usesRotarySampleDivider
        self.usesRiffle = usesRiffle
        self.usesIncrementDivision = usesIncrementDivision
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "usesRotarySampleDivider": usesRotarySampleDivider,
            "usesRiffle": usesRiffle,
            "usesIncrementDivision": usesIncrementDivision,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct SamplePreparationPulverizerValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct SamplePreparationScreenApertureValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct SamplePreparationStandardValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct SampleReductionGridSizeValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct SampleReductionLaboratoryValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct SampleReductionMethodValue: ConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var usesGrid: Bool
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        usesGrid: Bool,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.usesGrid = usesGrid
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let usesGrid = keyAndValues["usesGrid"] as? Bool,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.usesGrid = usesGrid
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "usesGrid": usesGrid,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct SampleReductionPointValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct SampleReductionSiteValue: ConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var isLabFacility: Bool
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        isLabFacility: Bool,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.isLabFacility = isLabFacility
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let isLabFacility = keyAndValues["isLabFacility"] as? Bool,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.isLabFacility = isLabFacility
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "isLabFacility": isLabFacility,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct SamplingCompanyValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct SamplingSiteValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct SamplingTransparencyValue: ConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var ranking: Int
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        ranking: Int,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.ranking = ranking
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let ranking = keyAndValues["ranking"] as? Int,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.ranking = ranking
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "ranking": ranking,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct SmelterValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct TraderValue: SimpleConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct WeighingMethodValue: ConfigurationConstantValue {
    public var id: Int
    public var value: String
    public var usesEquipment: Bool
    public var usesTallymen: Bool
    public var supportsABCChecks: Bool
    public var representsOtherValue: Bool
    public var isDeleted: Bool

    public init(
        id: ID,
        value: String,
        usesEquipment: Bool,
        usesTallymen: Bool,
        supportsABCChecks: Bool,
        representsOtherValue: Bool = false,
        isDeleted: Bool = false
    ) {
        self.id = id
        self.value = value
        self.usesEquipment = usesEquipment
        self.usesTallymen = usesTallymen
        self.supportsABCChecks = supportsABCChecks
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public init?(keyAndValues: [String: Any]) {
        guard
            let id = keyAndValues["id"] as? ID,
            let value = keyAndValues["value"] as? String,
            let usesEquipment = keyAndValues["usesEquipment"] as? Bool,
            let usesTallymen = keyAndValues["usesTallymen"] as? Bool,
            let supportsABCChecks = keyAndValues["supportsABCChecks"] as? Bool,
            let representsOtherValue = keyAndValues["representsOtherValue"] as? Bool,
            let isDeleted = keyAndValues["isDeleted"] as? Bool
        else {
            return nil
        }
        self.id = id
        self.value = value
        self.usesEquipment = usesEquipment
        self.usesTallymen = usesTallymen
        self.supportsABCChecks = supportsABCChecks
        self.representsOtherValue = representsOtherValue
        self.isDeleted = isDeleted
    }

    public func dictionaryValue() -> [String: Any] {
        [
            "id": id,
            "value": value,
            "usesEquipment": usesEquipment,
            "usesTallymen": usesTallymen,
            "supportsABCChecks": supportsABCChecks,
            "representsOtherValue": representsOtherValue,
            "isDeleted": isDeleted
        ]
    }
}

public struct ConfigurationConstants: Codable {
    public var agentValues: [AgentValue]
    public var clientValues: [ClientValue]
    public var commodityValues: [CommodityValue]
    public var dischargeGearValues: [DischargeGearValue]
    public var dischargeMethodValues: [DischargeMethodValue]
    public var dischargeWeatherConditionValues: [DischargeWeatherConditionValue]
    public var dischargeWeightWeighingPointValues: [DischargeWeightWeighingPointValue]
    public var inspectionCompanyValues: [InspectionCompanyValue]
    public var maritimePortValues: [MaritimePortValue]
    public var sampleCollectionMethodValues: [SampleCollectionMethodValue]
    public var sampleCollectionPointValues: [SampleCollectionPointValue]
    public var samplePreparationDivisionMethodValues: [SamplePreparationDivisionMethodValue]
    public var samplePreparationPulverizerValues: [SamplePreparationPulverizerValue]
    public var samplePreparationScreenApertureValues: [SamplePreparationScreenApertureValue]
    public var samplePreparationStandardValues: [SamplePreparationStandardValue]
    public var sampleReductionGridSizeValues: [SampleReductionGridSizeValue]
    public var sampleReductionLaboratoryValues: [SampleReductionLaboratoryValue]
    public var sampleReductionMethodValues: [SampleReductionMethodValue]
    public var sampleReductionPointValues: [SampleReductionPointValue]
    public var sampleReductionSiteValues: [SampleReductionSiteValue]
    public var samplingCompanyValues: [SamplingCompanyValue]
    public var samplingSiteValues: [SamplingSiteValue]
    public var samplingTransparencyValues: [SamplingTransparencyValue]
    public var smelterValues: [SmelterValue]
    public var traderValues: [TraderValue]
    public var weighingMethodValues: [WeighingMethodValue]

    public init(
        agentValues: [AgentValue],
        clientValues: [ClientValue],
        commodityValues: [CommodityValue],
        dischargeGearValues: [DischargeGearValue],
        dischargeMethodValues: [DischargeMethodValue],
        dischargeWeatherConditionValues: [DischargeWeatherConditionValue],
        dischargeWeightWeighingPointValues: [DischargeWeightWeighingPointValue],
        inspectionCompanyValues: [InspectionCompanyValue],
        maritimePortValues: [MaritimePortValue],
        sampleCollectionMethodValues: [SampleCollectionMethodValue],
        sampleCollectionPointValues: [SampleCollectionPointValue],
        samplePreparationDivisionMethodValues: [SamplePreparationDivisionMethodValue],
        samplePreparationPulverizerValues: [SamplePreparationPulverizerValue],
        samplePreparationScreenApertureValues: [SamplePreparationScreenApertureValue],
        samplePreparationStandardValues: [SamplePreparationStandardValue],
        sampleReductionGridSizeValues: [SampleReductionGridSizeValue],
        sampleReductionLaboratoryValues: [SampleReductionLaboratoryValue],
        sampleReductionMethodValues: [SampleReductionMethodValue],
        sampleReductionPointValues: [SampleReductionPointValue],
        sampleReductionSiteValues: [SampleReductionSiteValue],
        samplingCompanyValues: [SamplingCompanyValue],
        samplingSiteValues: [SamplingSiteValue],
        samplingTransparencyValues: [SamplingTransparencyValue],
        smelterValues: [SmelterValue],
        traderValues: [TraderValue],
        weighingMethodValues: [WeighingMethodValue]
    ) {
        self.agentValues = agentValues
        self.clientValues = clientValues
        self.commodityValues = commodityValues
        self.dischargeGearValues = dischargeGearValues
        self.dischargeMethodValues = dischargeMethodValues
        self.dischargeWeatherConditionValues = dischargeWeatherConditionValues
        self.dischargeWeightWeighingPointValues = dischargeWeightWeighingPointValues
        self.inspectionCompanyValues = inspectionCompanyValues
        self.maritimePortValues = maritimePortValues
        self.sampleCollectionMethodValues = sampleCollectionMethodValues
        self.sampleCollectionPointValues = sampleCollectionPointValues
        self.samplePreparationDivisionMethodValues = samplePreparationDivisionMethodValues
        self.samplePreparationPulverizerValues = samplePreparationPulverizerValues
        self.samplePreparationScreenApertureValues = samplePreparationScreenApertureValues
        self.samplePreparationStandardValues = samplePreparationStandardValues
        self.sampleReductionGridSizeValues = sampleReductionGridSizeValues
        self.sampleReductionLaboratoryValues = sampleReductionLaboratoryValues
        self.sampleReductionMethodValues = sampleReductionMethodValues
        self.sampleReductionPointValues = sampleReductionPointValues
        self.sampleReductionSiteValues = sampleReductionSiteValues
        self.samplingCompanyValues = samplingCompanyValues
        self.samplingSiteValues = samplingSiteValues
        self.samplingTransparencyValues = samplingTransparencyValues
        self.smelterValues = smelterValues
        self.traderValues = traderValues
        self.weighingMethodValues = weighingMethodValues
    }

    public enum CodingKeys: String, CodingKey {
        case agentValues
        case clientValues
        case commodityValues
        case dischargeGearValues
        case dischargeMethodValues
        case dischargeWeatherConditionValues
        case dischargeWeightWeighingPointValues
        case inspectionCompanyValues
        case maritimePortValues
        case sampleCollectionMethodValues
        case sampleCollectionPointValues
        case samplePreparationDivisionMethodValues
        case samplePreparationPulverizerValues
        case samplePreparationScreenApertureValues
        case samplePreparationStandardValues
        case sampleReductionGridSizeValues
        case sampleReductionLaboratoryValues
        case sampleReductionMethodValues
        case sampleReductionPointValues
        case sampleReductionSiteValues
        case samplingCompanyValues
        case samplingSiteValues
        case samplingTransparencyValues
        case smelterValues
        case traderValues
        case weighingMethodValues
    }
}
