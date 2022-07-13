//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public protocol PartialMergable {
    mutating func merge(from other: Self)
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

public protocol BillOfLadingPartialProperties: PartialMergable {
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

public struct BillOfLadingMutationRequest: BillOfLadingPartialProperties, Codable, Hashable {
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

    public mutating func merge(from other: Self) {
        self = Self(
            id: other.id,
            version: other.version,
            loadPortID: other.loadPortID ?? loadPortID,
            vesselHolds: other.vesselHolds ?? vesselHolds,
            weighingMethodID: other.weighingMethodID ?? weighingMethodID,
            wetMetricTonnes: other.wetMetricTonnes ?? wetMetricTonnes,
            moisturePercentage: other.moisturePercentage ?? moisturePercentage,
            dryMetricTonnes: other.dryMetricTonnes ?? dryMetricTonnes
        )
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

public protocol DischargePartialProperties: PartialMergable {
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

public struct DischargeMutationRequest: DischargePartialProperties, Codable, Hashable {
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

    public mutating func merge(from other: Self) {
        self = Self(
            id: other.id,
            version: other.version,
            berthName: other.berthName ?? berthName,
            berthLocation: other.berthLocation ?? berthLocation,
            gearID: other.gearID ?? gearID,
            methodID: other.methodID ?? methodID,
            cargoCondition: other.cargoCondition ?? cargoCondition,
            weatherConditionsID: other.weatherConditionsID ?? weatherConditionsID,
            startTime: other.startTime ?? startTime,
            finishTimeLastGrab: other.finishTimeLastGrab ?? finishTimeLastGrab,
            finishTimeCleanup: other.finishTimeCleanup ?? finishTimeCleanup,
            dischargeRateTonnesPerHour: other.dischargeRateTonnesPerHour ?? dischargeRateTonnesPerHour,
            saveAllTarpaulinsUsed: other.saveAllTarpaulinsUsed ?? saveAllTarpaulinsUsed,
            holdsCleaned: other.holdsCleaned ?? holdsCleaned,
            wharfCleaned: other.wharfCleaned ?? wharfCleaned
        )
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

public protocol DischargeWeightPartialProperties: PartialMergable {
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

public struct DischargeWeightMutationRequest: DischargeWeightPartialProperties, Codable, Hashable {
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

    public mutating func merge(from other: Self) {
        self = Self(
            id: other.id,
            version: other.version,
            kind: other.kind ?? kind,
            methodID: other.methodID ?? methodID,
            weighingPointID: other.weighingPointID ?? weighingPointID,
            weighingCompany: other.weighingCompany ?? weighingCompany,
            startTime: other.startTime ?? startTime,
            finishTime: other.finishTime ?? finishTime,
            wetMetricTonnes: other.wetMetricTonnes ?? wetMetricTonnes,
            moisturePercentage: other.moisturePercentage ?? moisturePercentage,
            dryMetricTonnes: other.dryMetricTonnes ?? dryMetricTonnes,
            equipmentName: other.equipmentName ?? equipmentName,
            equipmentModel: other.equipmentModel ?? equipmentModel,
            equipmentLocation: other.equipmentLocation ?? equipmentLocation,
            equipmentCertificationDate: other.equipmentCertificationDate ?? equipmentCertificationDate,
            calibrationCheck: other.calibrationCheck ?? calibrationCheck,
            abcCheck: other.abcCheck ?? abcCheck,
            tallymen: other.tallymen ?? tallymen,
            transparencyID: other.transparencyID ?? transparencyID
        )
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

public protocol MoistureDeterminationPartialProperties: PartialMergable {
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

public struct MoistureDeterminationMutationRequest: MoistureDeterminationPartialProperties, Codable, Hashable {
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

    public mutating func merge(from other: Self) {
        self = Self(
            id: other.id,
            version: other.version,
            moistureDeterminationCompanyID: other.moistureDeterminationCompanyID ?? moistureDeterminationCompanyID,
            siteID: other.siteID ?? siteID,
            location: other.location ?? location,
            lotSampleTrayWeightKilograms: other.lotSampleTrayWeightKilograms ?? lotSampleTrayWeightKilograms,
            ovenOnTime: other.ovenOnTime ?? ovenOnTime,
            ovenOffTime: other.ovenOffTime ?? ovenOffTime,
            ovenTemperatureCelsius: other.ovenTemperatureCelsius ?? ovenTemperatureCelsius,
            constantWeightCheck: other.constantWeightCheck ?? constantWeightCheck,
            resultsWaitTimeDays: other.resultsWaitTimeDays ?? resultsWaitTimeDays,
            transparencyID: other.transparencyID ?? transparencyID
        )
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

public protocol SampleCollectionPartialProperties: PartialMergable {
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

public struct SampleCollectionMutationRequest: SampleCollectionPartialProperties, Codable, Hashable {
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

    public mutating func merge(from other: Self) {
        self = Self(
            id: other.id,
            version: other.version,
            samplingCompanyID: other.samplingCompanyID ?? samplingCompanyID,
            siteID: other.siteID ?? siteID,
            location: other.location ?? location,
            samplingPointID: other.samplingPointID ?? samplingPointID,
            startTime: other.startTime ?? startTime,
            finishTime: other.finishTime ?? finishTime,
            methodID: other.methodID ?? methodID,
            sampleIncrementsWetTonnes: other.sampleIncrementsWetTonnes ?? sampleIncrementsWetTonnes,
            typicalSampleWeightKilograms: other.typicalSampleWeightKilograms ?? typicalSampleWeightKilograms,
            numberOfTrucksPerBag: other.numberOfTrucksPerBag ?? numberOfTrucksPerBag,
            lotSizeWetTonnes: other.lotSizeWetTonnes ?? lotSizeWetTonnes,
            sublotSizeWetTonnes: other.sublotSizeWetTonnes ?? sublotSizeWetTonnes,
            numberOfLots: other.numberOfLots ?? numberOfLots
        )
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

public protocol SamplePreparationPartialProperties: PartialMergable {
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

public struct SamplePreparationMutationRequest: SamplePreparationPartialProperties, Codable, Hashable {
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

    public mutating func merge(from other: Self) {
        self = Self(
            id: other.id,
            version: other.version,
            preparationCompanyID: other.preparationCompanyID ?? preparationCompanyID,
            siteID: other.siteID ?? siteID,
            location: other.location ?? location,
            startTime: other.startTime ?? startTime,
            finishTime: other.finishTime ?? finishTime,
            standardsID: other.standardsID ?? standardsID,
            wasScreened: other.wasScreened ?? wasScreened,
            screenApertureID: other.screenApertureID ?? screenApertureID,
            oversizePulverizedSeparately: other.oversizePulverizedSeparately ?? oversizePulverizedSeparately,
            sampleChargeWeightGrams: other.sampleChargeWeightGrams ?? sampleChargeWeightGrams,
            pulverizerID: other.pulverizerID ?? pulverizerID,
            pulverizingDurationSeconds: other.pulverizingDurationSeconds ?? pulverizingDurationSeconds,
            divisionMethodID: other.divisionMethodID ?? divisionMethodID,
            rsdNumberOfSegments: other.rsdNumberOfSegments ?? rsdNumberOfSegments,
            incrementISOScoopUsed: other.incrementISOScoopUsed ?? incrementISOScoopUsed,
            incrementBackingPlateUsed: other.incrementBackingPlateUsed ?? incrementBackingPlateUsed,
            incrementDividedToExtinction: other.incrementDividedToExtinction ?? incrementDividedToExtinction,
            riffleApertureMillimetres: other.riffleApertureMillimetres ?? riffleApertureMillimetres,
            numberOfSets: other.numberOfSets ?? numberOfSets,
            transparencyID: other.transparencyID ?? transparencyID
        )
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

public protocol SampleReductionPartialProperties: PartialMergable {
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

public struct SampleReductionMutationRequest: SampleReductionPartialProperties, Codable, Hashable {
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

    public mutating func merge(from other: Self) {
        self = Self(
            id: other.id,
            version: other.version,
            samplingCompanyID: other.samplingCompanyID ?? samplingCompanyID,
            location: other.location ?? location,
            siteID: other.siteID ?? siteID,
            laboratoryID: other.laboratoryID ?? laboratoryID,
            reductionPointID: other.reductionPointID ?? reductionPointID,
            startTime: other.startTime ?? startTime,
            finishTime: other.finishTime ?? finishTime,
            screenApertureMillimetres: other.screenApertureMillimetres ?? screenApertureMillimetres,
            wasConedAndQuartered: other.wasConedAndQuartered ?? wasConedAndQuartered,
            methodID: other.methodID ?? methodID,
            gridSizeID: other.gridSizeID ?? gridSizeID
        )
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

public protocol ShipmentDetailsPartialProperties: PartialMergable {
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

public struct ShipmentDetailsMutationRequest: ShipmentDetailsPartialProperties, Codable, Hashable {
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

    public mutating func merge(from other: Self) {
        self = Self(
            id: other.id,
            version: other.version,
            creationDate: other.creationDate ?? creationDate,
            clientReference: other.clientReference ?? clientReference,
            logDate: other.logDate ?? logDate,
            norTime: other.norTime ?? norTime,
            vesselName: other.vesselName ?? vesselName,
            clientID: other.clientID ?? clientID,
            commodityID: other.commodityID ?? commodityID,
            agentID: other.agentID ?? agentID,
            traderID: other.traderID ?? traderID,
            smelterID: other.smelterID ?? smelterID,
            dischargePortID: other.dischargePortID ?? dischargePortID,
            inspectionCompanyReceiverID: other.inspectionCompanyReceiverID ?? inspectionCompanyReceiverID,
            inspectionCompanySellerID: other.inspectionCompanySellerID ?? inspectionCompanySellerID,
            inspectionCompanySecondAgentID: other.inspectionCompanySecondAgentID ?? inspectionCompanySecondAgentID,
            conradTeamSize: other.conradTeamSize ?? conradTeamSize
        )
    }
}
