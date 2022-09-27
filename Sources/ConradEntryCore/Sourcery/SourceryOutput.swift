//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public protocol Partial {
    var isEmpty: Bool { get }
    mutating func merge(from other: Self)
}

public protocol MutationRequest {
    init(keyAndValues: [String: Any])
}

public protocol PartialMutationRequest: Partial, MutationRequest {
    static func empty() -> Self
}

// MARK: - BillOfLading

// MARK: Protocol

public protocol BillOfLadingProperties {
    var loadPortID: Int { get }
    var vesselHolds: Set<Int> { get }
    var methodID: Int { get }
    var wetMetricTonnes: Double { get }
    var moisturePercentage: Double { get }
    var dryMetricTonnes: Double { get }
}

public protocol BillOfLadingPartialProperties {
    var loadPortID: Int? { get }
    var vesselHolds: Set<Int>? { get }
    var methodID: Int? { get }
    var wetMetricTonnes: Double? { get }
    var moisturePercentage: Double? { get }
    var dryMetricTonnes: Double? { get }
}

// MARK: CodingKeys

private enum BillOfLadingCodingKeys: String, CodingKey {
    case id
    case version
    case loadPortID
    case vesselHolds
    case methodID
    case wetMetricTonnes
    case moisturePercentage
    case dryMetricTonnes
}

// MARK: CreationRequest

public struct BillOfLadingCreationRequest: BillOfLadingProperties, Codable, Hashable, Sendable {
    public var loadPortID: Int
    public var vesselHolds: Set<Int>
    public var methodID: Int
    public var wetMetricTonnes: Double
    public var moisturePercentage: Double
    public var dryMetricTonnes: Double

    public init(
        loadPortID: Int,
        vesselHolds: Set<Int>,
        methodID: Int,
        wetMetricTonnes: Double,
        moisturePercentage: Double,
        dryMetricTonnes: Double
    ) {
        self.loadPortID = loadPortID
        self.vesselHolds = vesselHolds
        self.methodID = methodID
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
    }

    public init?(mutationRequest: BillOfLadingMutationRequest) {
        guard
            let loadPortID = mutationRequest.loadPortID,
            let vesselHolds = mutationRequest.vesselHolds,
            let methodID = mutationRequest.methodID,
            let wetMetricTonnes = mutationRequest.wetMetricTonnes,
            let moisturePercentage = mutationRequest.moisturePercentage,
            let dryMetricTonnes = mutationRequest.dryMetricTonnes
        else {
            return nil
        }

        self.loadPortID = loadPortID
        self.vesselHolds = vesselHolds
        self.methodID = methodID
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
    }
}

// MARK: MutationRequest

public struct BillOfLadingMutationRequest: BillOfLadingPartialProperties, PartialMutationRequest, MutationRequest, Codable, Hashable, Sendable {
    public var loadPortID: Int?
    public var vesselHolds: Set<Int>?
    public var methodID: Int?
    public var wetMetricTonnes: Double?
    public var moisturePercentage: Double?
    public var dryMetricTonnes: Double?

    public init(
        loadPortID: Int? = nil,
        vesselHolds: Set<Int>? = nil,
        methodID: Int? = nil,
        wetMetricTonnes: Double? = nil,
        moisturePercentage: Double? = nil,
        dryMetricTonnes: Double? = nil
    ) {
        self.loadPortID = loadPortID
        self.vesselHolds = vesselHolds
        self.methodID = methodID
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BillOfLadingCodingKeys.self)
        if container.contains(.loadPortID) {
            self.loadPortID = try container.decode(Int.self, forKey: .loadPortID)
        } else {
            self.loadPortID = nil
        }
        if container.contains(.vesselHolds) {
            self.vesselHolds = try container.decode(Set<Int>.self, forKey: .vesselHolds)
        } else {
            self.vesselHolds = nil
        }
        if container.contains(.methodID) {
            self.methodID = try container.decode(Int.self, forKey: .methodID)
        } else {
            self.methodID = nil
        }
        if container.contains(.wetMetricTonnes) {
            self.wetMetricTonnes = try container.decode(Double.self, forKey: .wetMetricTonnes)
        } else {
            self.wetMetricTonnes = nil
        }
        if container.contains(.moisturePercentage) {
            self.moisturePercentage = try container.decode(Double.self, forKey: .moisturePercentage)
        } else {
            self.moisturePercentage = nil
        }
        if container.contains(.dryMetricTonnes) {
            self.dryMetricTonnes = try container.decode(Double.self, forKey: .dryMetricTonnes)
        } else {
            self.dryMetricTonnes = nil
        }
    }

    public init(keyAndValues: [String: Any]) {
        if let loadPortID = keyAndValues["loadPortID"] as? Int {
            self.loadPortID = loadPortID
        }
        if let vesselHolds = keyAndValues["vesselHolds"] as? Set<Int> {
            self.vesselHolds = vesselHolds
        }
        if let methodID = keyAndValues["methodID"] as? Int {
            self.methodID = methodID
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
        if let updatedValue = other.methodID {
            methodID = updatedValue
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

    public var isEmpty: Bool {
        loadPortID == nil &&
            vesselHolds == nil &&
            methodID == nil &&
            wetMetricTonnes == nil &&
            moisturePercentage == nil &&
            dryMetricTonnes == nil
    }
}

// MARK: DTO

public struct BillOfLadingDTO: BillOfLadingProperties, Codable, Hashable, APIResponseItem, Sendable {
    public let id: UUID
    public let version: Date
    public let loadPortID: Int
    public let vesselHolds: Set<Int>
    public let methodID: Int
    public let wetMetricTonnes: Double
    public let moisturePercentage: Double
    public let dryMetricTonnes: Double

    public init(
        id: UUID,
        version: Date,
        loadPortID: Int,
        vesselHolds: Set<Int>,
        methodID: Int,
        wetMetricTonnes: Double,
        moisturePercentage: Double,
        dryMetricTonnes: Double
    ) {
        self.id = id
        self.version = version
        self.loadPortID = loadPortID
        self.vesselHolds = vesselHolds
        self.methodID = methodID
        self.wetMetricTonnes = wetMetricTonnes
        self.moisturePercentage = moisturePercentage
        self.dryMetricTonnes = dryMetricTonnes
    }

    public init?(partial: PartialBillOfLadingDTO) {
        guard
            let loadPortID = partial.loadPortID,
            let vesselHolds = partial.vesselHolds,
            let methodID = partial.methodID,
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
        self.methodID = methodID
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
        self.methodID = creationRequest.methodID
        self.wetMetricTonnes = creationRequest.wetMetricTonnes
        self.moisturePercentage = creationRequest.moisturePercentage
        self.dryMetricTonnes = creationRequest.dryMetricTonnes
    }
}

// MARK: PartialDTO

public struct PartialBillOfLadingDTO: BillOfLadingPartialProperties, Codable, Hashable, APIResponseItem, Partial, Sendable {
    public let id: UUID
    public let version: Date
    public let loadPortID: Int?
    public let vesselHolds: Set<Int>?
    public let methodID: Int?
    public let wetMetricTonnes: Double?
    public let moisturePercentage: Double?
    public let dryMetricTonnes: Double?

    public init(
        id: UUID,
        version: Date,
        loadPortID: Int? = nil,
        vesselHolds: Set<Int>? = nil,
        methodID: Int? = nil,
        wetMetricTonnes: Double? = nil,
        moisturePercentage: Double? = nil,
        dryMetricTonnes: Double? = nil
    ) {
        self.id = id
        self.version = version
        self.loadPortID = loadPortID
        self.vesselHolds = vesselHolds
        self.methodID = methodID
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
        self.methodID = other.methodID
        self.wetMetricTonnes = other.wetMetricTonnes
        self.moisturePercentage = other.moisturePercentage
        self.dryMetricTonnes = other.dryMetricTonnes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BillOfLadingCodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.version = try container.decode(Date.self, forKey: .version)
        if container.contains(.loadPortID) {
            self.loadPortID = try container.decode(Int.self, forKey: .loadPortID)
        } else {
            self.loadPortID = nil
        }
        if container.contains(.vesselHolds) {
            self.vesselHolds = try container.decode(Set<Int>.self, forKey: .vesselHolds)
        } else {
            self.vesselHolds = nil
        }
        if container.contains(.methodID) {
            self.methodID = try container.decode(Int.self, forKey: .methodID)
        } else {
            self.methodID = nil
        }
        if container.contains(.wetMetricTonnes) {
            self.wetMetricTonnes = try container.decode(Double.self, forKey: .wetMetricTonnes)
        } else {
            self.wetMetricTonnes = nil
        }
        if container.contains(.moisturePercentage) {
            self.moisturePercentage = try container.decode(Double.self, forKey: .moisturePercentage)
        } else {
            self.moisturePercentage = nil
        }
        if container.contains(.dryMetricTonnes) {
            self.dryMetricTonnes = try container.decode(Double.self, forKey: .dryMetricTonnes)
        } else {
            self.dryMetricTonnes = nil
        }
    }

    public var isEmpty: Bool {
        loadPortID == nil &&
            vesselHolds == nil &&
            methodID == nil &&
            wetMetricTonnes == nil &&
            moisturePercentage == nil &&
            dryMetricTonnes == nil
    }

    public mutating func merge(from other: Self) {
        self = Self(
            id: other.id,
            version: other.version,
            loadPortID: other.loadPortID ?? loadPortID,
            vesselHolds: other.vesselHolds ?? vesselHolds,
            methodID: other.methodID ?? methodID,
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
    var cargoCondition: CargoCondition { get }
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
    var cargoCondition: CargoCondition? { get }
    var weatherConditionsID: Int? { get }
    var startTime: Date? { get }
    var finishTimeLastGrab: Date? { get }
    var finishTimeCleanup: Date? { get }
    var dischargeRateTonnesPerHour: Double? { get }
    var saveAllTarpaulinsUsed: Bool? { get }
    var holdsCleaned: Bool? { get }
    var wharfCleaned: Bool? { get }
}

// MARK: CodingKeys

private enum DischargeCodingKeys: String, CodingKey {
    case id
    case version
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
}

// MARK: CreationRequest

public struct DischargeCreationRequest: DischargeProperties, Codable, Hashable, Sendable {
    public var berthName: String
    public var berthLocation: LocationDTO
    public var gearID: Int
    public var methodID: Int
    public var cargoCondition: CargoCondition
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
        cargoCondition: CargoCondition,
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

public struct DischargeMutationRequest: DischargePartialProperties, PartialMutationRequest, MutationRequest, Codable, Hashable, Sendable {
    public var berthName: String?
    public var berthLocation: LocationDTO?
    public var gearID: Int?
    public var methodID: Int?
    public var cargoCondition: CargoCondition?
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
        cargoCondition: CargoCondition? = nil,
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DischargeCodingKeys.self)
        if container.contains(.berthName) {
            self.berthName = try container.decode(String.self, forKey: .berthName)
        } else {
            self.berthName = nil
        }
        if container.contains(.berthLocation) {
            self.berthLocation = try container.decode(LocationDTO.self, forKey: .berthLocation)
        } else {
            self.berthLocation = nil
        }
        if container.contains(.gearID) {
            self.gearID = try container.decode(Int.self, forKey: .gearID)
        } else {
            self.gearID = nil
        }
        if container.contains(.methodID) {
            self.methodID = try container.decode(Int.self, forKey: .methodID)
        } else {
            self.methodID = nil
        }
        if container.contains(.cargoCondition) {
            self.cargoCondition = try container.decode(CargoCondition.self, forKey: .cargoCondition)
        } else {
            self.cargoCondition = nil
        }
        if container.contains(.weatherConditionsID) {
            self.weatherConditionsID = try container.decode(Int.self, forKey: .weatherConditionsID)
        } else {
            self.weatherConditionsID = nil
        }
        if container.contains(.startTime) {
            self.startTime = try container.decode(Date.self, forKey: .startTime)
        } else {
            self.startTime = nil
        }
        if container.contains(.finishTimeLastGrab) {
            self.finishTimeLastGrab = try container.decode(Date.self, forKey: .finishTimeLastGrab)
        } else {
            self.finishTimeLastGrab = nil
        }
        if container.contains(.finishTimeCleanup) {
            self.finishTimeCleanup = try container.decode(Date.self, forKey: .finishTimeCleanup)
        } else {
            self.finishTimeCleanup = nil
        }
        if container.contains(.dischargeRateTonnesPerHour) {
            self.dischargeRateTonnesPerHour = try container.decode(Double.self, forKey: .dischargeRateTonnesPerHour)
        } else {
            self.dischargeRateTonnesPerHour = nil
        }
        if container.contains(.saveAllTarpaulinsUsed) {
            self.saveAllTarpaulinsUsed = try container.decode(Bool.self, forKey: .saveAllTarpaulinsUsed)
        } else {
            self.saveAllTarpaulinsUsed = nil
        }
        if container.contains(.holdsCleaned) {
            self.holdsCleaned = try container.decode(Bool.self, forKey: .holdsCleaned)
        } else {
            self.holdsCleaned = nil
        }
        if container.contains(.wharfCleaned) {
            self.wharfCleaned = try container.decode(Bool.self, forKey: .wharfCleaned)
        } else {
            self.wharfCleaned = nil
        }
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
        if let cargoCondition = keyAndValues["cargoCondition"] as? CargoCondition {
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

    public var isEmpty: Bool {
        berthName == nil &&
            berthLocation == nil &&
            gearID == nil &&
            methodID == nil &&
            cargoCondition == nil &&
            weatherConditionsID == nil &&
            startTime == nil &&
            finishTimeLastGrab == nil &&
            finishTimeCleanup == nil &&
            dischargeRateTonnesPerHour == nil &&
            saveAllTarpaulinsUsed == nil &&
            holdsCleaned == nil &&
            wharfCleaned == nil
    }
}

// MARK: DTO

public struct DischargeDTO: DischargeProperties, Codable, Hashable, APIResponseItem, Sendable {
    public let id: UUID
    public let version: Date
    public let berthName: String
    public let berthLocation: LocationDTO
    public let gearID: Int
    public let methodID: Int
    public let cargoCondition: CargoCondition
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
        cargoCondition: CargoCondition,
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

public struct PartialDischargeDTO: DischargePartialProperties, Codable, Hashable, APIResponseItem, Partial, Sendable {
    public let id: UUID
    public let version: Date
    public let berthName: String?
    public let berthLocation: LocationDTO?
    public let gearID: Int?
    public let methodID: Int?
    public let cargoCondition: CargoCondition?
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
        cargoCondition: CargoCondition? = nil,
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DischargeCodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.version = try container.decode(Date.self, forKey: .version)
        if container.contains(.berthName) {
            self.berthName = try container.decode(String.self, forKey: .berthName)
        } else {
            self.berthName = nil
        }
        if container.contains(.berthLocation) {
            self.berthLocation = try container.decode(LocationDTO.self, forKey: .berthLocation)
        } else {
            self.berthLocation = nil
        }
        if container.contains(.gearID) {
            self.gearID = try container.decode(Int.self, forKey: .gearID)
        } else {
            self.gearID = nil
        }
        if container.contains(.methodID) {
            self.methodID = try container.decode(Int.self, forKey: .methodID)
        } else {
            self.methodID = nil
        }
        if container.contains(.cargoCondition) {
            self.cargoCondition = try container.decode(CargoCondition.self, forKey: .cargoCondition)
        } else {
            self.cargoCondition = nil
        }
        if container.contains(.weatherConditionsID) {
            self.weatherConditionsID = try container.decode(Int.self, forKey: .weatherConditionsID)
        } else {
            self.weatherConditionsID = nil
        }
        if container.contains(.startTime) {
            self.startTime = try container.decode(Date.self, forKey: .startTime)
        } else {
            self.startTime = nil
        }
        if container.contains(.finishTimeLastGrab) {
            self.finishTimeLastGrab = try container.decode(Date.self, forKey: .finishTimeLastGrab)
        } else {
            self.finishTimeLastGrab = nil
        }
        if container.contains(.finishTimeCleanup) {
            self.finishTimeCleanup = try container.decode(Date.self, forKey: .finishTimeCleanup)
        } else {
            self.finishTimeCleanup = nil
        }
        if container.contains(.dischargeRateTonnesPerHour) {
            self.dischargeRateTonnesPerHour = try container.decode(Double.self, forKey: .dischargeRateTonnesPerHour)
        } else {
            self.dischargeRateTonnesPerHour = nil
        }
        if container.contains(.saveAllTarpaulinsUsed) {
            self.saveAllTarpaulinsUsed = try container.decode(Bool.self, forKey: .saveAllTarpaulinsUsed)
        } else {
            self.saveAllTarpaulinsUsed = nil
        }
        if container.contains(.holdsCleaned) {
            self.holdsCleaned = try container.decode(Bool.self, forKey: .holdsCleaned)
        } else {
            self.holdsCleaned = nil
        }
        if container.contains(.wharfCleaned) {
            self.wharfCleaned = try container.decode(Bool.self, forKey: .wharfCleaned)
        } else {
            self.wharfCleaned = nil
        }
    }

    public var isEmpty: Bool {
        berthName == nil &&
            berthLocation == nil &&
            gearID == nil &&
            methodID == nil &&
            cargoCondition == nil &&
            weatherConditionsID == nil &&
            startTime == nil &&
            finishTimeLastGrab == nil &&
            finishTimeCleanup == nil &&
            dischargeRateTonnesPerHour == nil &&
            saveAllTarpaulinsUsed == nil &&
            holdsCleaned == nil &&
            wharfCleaned == nil
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

// MARK: CodingKeys

private enum DischargeWeightCodingKeys: String, CodingKey {
    case id
    case version
    case kind
    case methodID
    case weighingPointID
    case weighingCompany
    case startTime
    case finishTime
    case wetMetricTonnes
    case moisturePercentage
    case dryMetricTonnes
    case equipmentName
    case equipmentModel
    case equipmentLocation
    case equipmentCertificationDate
    case calibrationCheck
    case abcCheck
    case tallymen
    case transparencyID
}

// MARK: CreationRequest

public struct DischargeWeightCreationRequest: DischargeWeightProperties, Codable, Hashable, Sendable {
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

public struct DischargeWeightMutationRequest: DischargeWeightPartialProperties, PartialMutationRequest, MutationRequest, Codable, Hashable, Sendable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DischargeWeightCodingKeys.self)
        if container.contains(.kind) {
            self.kind = try container.decode(DischargeWeightKind.self, forKey: .kind)
        } else {
            self.kind = nil
        }
        if container.contains(.methodID) {
            self.methodID = try container.decode(Int.self, forKey: .methodID)
        } else {
            self.methodID = nil
        }
        if container.contains(.weighingPointID) {
            self.weighingPointID = try container.decode(Int.self, forKey: .weighingPointID)
        } else {
            self.weighingPointID = nil
        }
        if container.contains(.weighingCompany) {
            self.weighingCompany = try container.decode(String.self, forKey: .weighingCompany)
        } else {
            self.weighingCompany = nil
        }
        if container.contains(.startTime) {
            self.startTime = try container.decode(Date.self, forKey: .startTime)
        } else {
            self.startTime = nil
        }
        if container.contains(.finishTime) {
            self.finishTime = try container.decode(Date.self, forKey: .finishTime)
        } else {
            self.finishTime = nil
        }
        if container.contains(.wetMetricTonnes) {
            self.wetMetricTonnes = try container.decode(Double.self, forKey: .wetMetricTonnes)
        } else {
            self.wetMetricTonnes = nil
        }
        if container.contains(.moisturePercentage) {
            self.moisturePercentage = try container.decode(Double.self, forKey: .moisturePercentage)
        } else {
            self.moisturePercentage = nil
        }
        if container.contains(.dryMetricTonnes) {
            self.dryMetricTonnes = try container.decode(Double.self, forKey: .dryMetricTonnes)
        } else {
            self.dryMetricTonnes = nil
        }
        if container.contains(.equipmentName) {
            self.equipmentName = try container.decode(String?.self, forKey: .equipmentName)
        } else {
            self.equipmentName = nil
        }
        if container.contains(.equipmentModel) {
            self.equipmentModel = try container.decode(String?.self, forKey: .equipmentModel)
        } else {
            self.equipmentModel = nil
        }
        if container.contains(.equipmentLocation) {
            self.equipmentLocation = try container.decode(LocationDTO?.self, forKey: .equipmentLocation)
        } else {
            self.equipmentLocation = nil
        }
        if container.contains(.equipmentCertificationDate) {
            self.equipmentCertificationDate = try container.decode(Date?.self, forKey: .equipmentCertificationDate)
        } else {
            self.equipmentCertificationDate = nil
        }
        if container.contains(.calibrationCheck) {
            self.calibrationCheck = try container.decode(CalibrationCheck?.self, forKey: .calibrationCheck)
        } else {
            self.calibrationCheck = nil
        }
        if container.contains(.abcCheck) {
            self.abcCheck = try container.decode(ABCCheck?.self, forKey: .abcCheck)
        } else {
            self.abcCheck = nil
        }
        if container.contains(.tallymen) {
            self.tallymen = try container.decode(Tallymen?.self, forKey: .tallymen)
        } else {
            self.tallymen = nil
        }
        if container.contains(.transparencyID) {
            self.transparencyID = try container.decode(Int.self, forKey: .transparencyID)
        } else {
            self.transparencyID = nil
        }
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

    public var isEmpty: Bool {
        kind == nil &&
            methodID == nil &&
            weighingPointID == nil &&
            weighingCompany == nil &&
            startTime == nil &&
            finishTime == nil &&
            wetMetricTonnes == nil &&
            moisturePercentage == nil &&
            dryMetricTonnes == nil &&
            equipmentName == nil &&
            equipmentModel == nil &&
            equipmentLocation == nil &&
            equipmentCertificationDate == nil &&
            calibrationCheck == nil &&
            abcCheck == nil &&
            tallymen == nil &&
            transparencyID == nil
    }
}

// MARK: DTO

public struct DischargeWeightDTO: DischargeWeightProperties, Codable, Hashable, APIResponseItem, Sendable {
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

public struct PartialDischargeWeightDTO: DischargeWeightPartialProperties, Codable, Hashable, APIResponseItem, Partial, Sendable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DischargeWeightCodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.version = try container.decode(Date.self, forKey: .version)
        if container.contains(.kind) {
            self.kind = try container.decode(DischargeWeightKind.self, forKey: .kind)
        } else {
            self.kind = nil
        }
        if container.contains(.methodID) {
            self.methodID = try container.decode(Int.self, forKey: .methodID)
        } else {
            self.methodID = nil
        }
        if container.contains(.weighingPointID) {
            self.weighingPointID = try container.decode(Int.self, forKey: .weighingPointID)
        } else {
            self.weighingPointID = nil
        }
        if container.contains(.weighingCompany) {
            self.weighingCompany = try container.decode(String.self, forKey: .weighingCompany)
        } else {
            self.weighingCompany = nil
        }
        if container.contains(.startTime) {
            self.startTime = try container.decode(Date.self, forKey: .startTime)
        } else {
            self.startTime = nil
        }
        if container.contains(.finishTime) {
            self.finishTime = try container.decode(Date.self, forKey: .finishTime)
        } else {
            self.finishTime = nil
        }
        if container.contains(.wetMetricTonnes) {
            self.wetMetricTonnes = try container.decode(Double.self, forKey: .wetMetricTonnes)
        } else {
            self.wetMetricTonnes = nil
        }
        if container.contains(.moisturePercentage) {
            self.moisturePercentage = try container.decode(Double.self, forKey: .moisturePercentage)
        } else {
            self.moisturePercentage = nil
        }
        if container.contains(.dryMetricTonnes) {
            self.dryMetricTonnes = try container.decode(Double.self, forKey: .dryMetricTonnes)
        } else {
            self.dryMetricTonnes = nil
        }
        if container.contains(.equipmentName) {
            self.equipmentName = try container.decode(String?.self, forKey: .equipmentName)
        } else {
            self.equipmentName = nil
        }
        if container.contains(.equipmentModel) {
            self.equipmentModel = try container.decode(String?.self, forKey: .equipmentModel)
        } else {
            self.equipmentModel = nil
        }
        if container.contains(.equipmentLocation) {
            self.equipmentLocation = try container.decode(LocationDTO?.self, forKey: .equipmentLocation)
        } else {
            self.equipmentLocation = nil
        }
        if container.contains(.equipmentCertificationDate) {
            self.equipmentCertificationDate = try container.decode(Date?.self, forKey: .equipmentCertificationDate)
        } else {
            self.equipmentCertificationDate = nil
        }
        if container.contains(.calibrationCheck) {
            self.calibrationCheck = try container.decode(CalibrationCheck?.self, forKey: .calibrationCheck)
        } else {
            self.calibrationCheck = nil
        }
        if container.contains(.abcCheck) {
            self.abcCheck = try container.decode(ABCCheck?.self, forKey: .abcCheck)
        } else {
            self.abcCheck = nil
        }
        if container.contains(.tallymen) {
            self.tallymen = try container.decode(Tallymen?.self, forKey: .tallymen)
        } else {
            self.tallymen = nil
        }
        if container.contains(.transparencyID) {
            self.transparencyID = try container.decode(Int.self, forKey: .transparencyID)
        } else {
            self.transparencyID = nil
        }
    }

    public var isEmpty: Bool {
        kind == nil &&
            methodID == nil &&
            weighingPointID == nil &&
            weighingCompany == nil &&
            startTime == nil &&
            finishTime == nil &&
            wetMetricTonnes == nil &&
            moisturePercentage == nil &&
            dryMetricTonnes == nil &&
            equipmentName == nil &&
            equipmentModel == nil &&
            equipmentLocation == nil &&
            equipmentCertificationDate == nil &&
            calibrationCheck == nil &&
            abcCheck == nil &&
            tallymen == nil &&
            transparencyID == nil
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

// MARK: CodingKeys

private enum MoistureDeterminationCodingKeys: String, CodingKey {
    case id
    case version
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
}

// MARK: CreationRequest

public struct MoistureDeterminationCreationRequest: MoistureDeterminationProperties, Codable, Hashable, Sendable {
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

public struct MoistureDeterminationMutationRequest: MoistureDeterminationPartialProperties, PartialMutationRequest, MutationRequest, Codable, Hashable, Sendable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MoistureDeterminationCodingKeys.self)
        if container.contains(.moistureDeterminationCompanyID) {
            self.moistureDeterminationCompanyID = try container.decode(Int.self, forKey: .moistureDeterminationCompanyID)
        } else {
            self.moistureDeterminationCompanyID = nil
        }
        if container.contains(.siteID) {
            self.siteID = try container.decode(Int.self, forKey: .siteID)
        } else {
            self.siteID = nil
        }
        if container.contains(.location) {
            self.location = try container.decode(LocationDTO.self, forKey: .location)
        } else {
            self.location = nil
        }
        if container.contains(.lotSampleTrayWeightKilograms) {
            self.lotSampleTrayWeightKilograms = try container.decode(Double.self, forKey: .lotSampleTrayWeightKilograms)
        } else {
            self.lotSampleTrayWeightKilograms = nil
        }
        if container.contains(.ovenOnTime) {
            self.ovenOnTime = try container.decode(Date.self, forKey: .ovenOnTime)
        } else {
            self.ovenOnTime = nil
        }
        if container.contains(.ovenOffTime) {
            self.ovenOffTime = try container.decode(Date.self, forKey: .ovenOffTime)
        } else {
            self.ovenOffTime = nil
        }
        if container.contains(.ovenTemperatureCelsius) {
            self.ovenTemperatureCelsius = try container.decode(Int.self, forKey: .ovenTemperatureCelsius)
        } else {
            self.ovenTemperatureCelsius = nil
        }
        if container.contains(.constantWeightCheck) {
            self.constantWeightCheck = try container.decode(ConstantWeightCheck?.self, forKey: .constantWeightCheck)
        } else {
            self.constantWeightCheck = nil
        }
        if container.contains(.resultsWaitTimeDays) {
            self.resultsWaitTimeDays = try container.decode(Int.self, forKey: .resultsWaitTimeDays)
        } else {
            self.resultsWaitTimeDays = nil
        }
        if container.contains(.transparencyID) {
            self.transparencyID = try container.decode(Int.self, forKey: .transparencyID)
        } else {
            self.transparencyID = nil
        }
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

    public var isEmpty: Bool {
        moistureDeterminationCompanyID == nil &&
            siteID == nil &&
            location == nil &&
            lotSampleTrayWeightKilograms == nil &&
            ovenOnTime == nil &&
            ovenOffTime == nil &&
            ovenTemperatureCelsius == nil &&
            constantWeightCheck == nil &&
            resultsWaitTimeDays == nil &&
            transparencyID == nil
    }
}

// MARK: DTO

public struct MoistureDeterminationDTO: MoistureDeterminationProperties, Codable, Hashable, APIResponseItem, Sendable {
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

public struct PartialMoistureDeterminationDTO: MoistureDeterminationPartialProperties, Codable, Hashable, APIResponseItem, Partial, Sendable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MoistureDeterminationCodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.version = try container.decode(Date.self, forKey: .version)
        if container.contains(.moistureDeterminationCompanyID) {
            self.moistureDeterminationCompanyID = try container.decode(Int.self, forKey: .moistureDeterminationCompanyID)
        } else {
            self.moistureDeterminationCompanyID = nil
        }
        if container.contains(.siteID) {
            self.siteID = try container.decode(Int.self, forKey: .siteID)
        } else {
            self.siteID = nil
        }
        if container.contains(.location) {
            self.location = try container.decode(LocationDTO.self, forKey: .location)
        } else {
            self.location = nil
        }
        if container.contains(.lotSampleTrayWeightKilograms) {
            self.lotSampleTrayWeightKilograms = try container.decode(Double.self, forKey: .lotSampleTrayWeightKilograms)
        } else {
            self.lotSampleTrayWeightKilograms = nil
        }
        if container.contains(.ovenOnTime) {
            self.ovenOnTime = try container.decode(Date.self, forKey: .ovenOnTime)
        } else {
            self.ovenOnTime = nil
        }
        if container.contains(.ovenOffTime) {
            self.ovenOffTime = try container.decode(Date.self, forKey: .ovenOffTime)
        } else {
            self.ovenOffTime = nil
        }
        if container.contains(.ovenTemperatureCelsius) {
            self.ovenTemperatureCelsius = try container.decode(Int.self, forKey: .ovenTemperatureCelsius)
        } else {
            self.ovenTemperatureCelsius = nil
        }
        if container.contains(.constantWeightCheck) {
            self.constantWeightCheck = try container.decode(ConstantWeightCheck?.self, forKey: .constantWeightCheck)
        } else {
            self.constantWeightCheck = nil
        }
        if container.contains(.resultsWaitTimeDays) {
            self.resultsWaitTimeDays = try container.decode(Int.self, forKey: .resultsWaitTimeDays)
        } else {
            self.resultsWaitTimeDays = nil
        }
        if container.contains(.transparencyID) {
            self.transparencyID = try container.decode(Int.self, forKey: .transparencyID)
        } else {
            self.transparencyID = nil
        }
    }

    public var isEmpty: Bool {
        moistureDeterminationCompanyID == nil &&
            siteID == nil &&
            location == nil &&
            lotSampleTrayWeightKilograms == nil &&
            ovenOnTime == nil &&
            ovenOffTime == nil &&
            ovenTemperatureCelsius == nil &&
            constantWeightCheck == nil &&
            resultsWaitTimeDays == nil &&
            transparencyID == nil
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

// MARK: CodingKeys

private enum SampleCollectionCodingKeys: String, CodingKey {
    case id
    case version
    case samplingCompanyID
    case siteID
    case location
    case samplingPointID
    case startTime
    case finishTime
    case methodID
    case sampleIncrementsWetTonnes
    case typicalSampleWeightKilograms
    case numberOfTrucksPerBag
    case lotSizeWetTonnes
    case sublotSizeWetTonnes
    case numberOfLots
}

// MARK: CreationRequest

public struct SampleCollectionCreationRequest: SampleCollectionProperties, Codable, Hashable, Sendable {
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

public struct SampleCollectionMutationRequest: SampleCollectionPartialProperties, PartialMutationRequest, MutationRequest, Codable, Hashable, Sendable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SampleCollectionCodingKeys.self)
        if container.contains(.samplingCompanyID) {
            self.samplingCompanyID = try container.decode(Int.self, forKey: .samplingCompanyID)
        } else {
            self.samplingCompanyID = nil
        }
        if container.contains(.siteID) {
            self.siteID = try container.decode(Int.self, forKey: .siteID)
        } else {
            self.siteID = nil
        }
        if container.contains(.location) {
            self.location = try container.decode(LocationDTO.self, forKey: .location)
        } else {
            self.location = nil
        }
        if container.contains(.samplingPointID) {
            self.samplingPointID = try container.decode(Int.self, forKey: .samplingPointID)
        } else {
            self.samplingPointID = nil
        }
        if container.contains(.startTime) {
            self.startTime = try container.decode(Date.self, forKey: .startTime)
        } else {
            self.startTime = nil
        }
        if container.contains(.finishTime) {
            self.finishTime = try container.decode(Date.self, forKey: .finishTime)
        } else {
            self.finishTime = nil
        }
        if container.contains(.methodID) {
            self.methodID = try container.decode(Int.self, forKey: .methodID)
        } else {
            self.methodID = nil
        }
        if container.contains(.sampleIncrementsWetTonnes) {
            self.sampleIncrementsWetTonnes = try container.decode(Double.self, forKey: .sampleIncrementsWetTonnes)
        } else {
            self.sampleIncrementsWetTonnes = nil
        }
        if container.contains(.typicalSampleWeightKilograms) {
            self.typicalSampleWeightKilograms = try container.decode(Double.self, forKey: .typicalSampleWeightKilograms)
        } else {
            self.typicalSampleWeightKilograms = nil
        }
        if container.contains(.numberOfTrucksPerBag) {
            self.numberOfTrucksPerBag = try container.decode(Int?.self, forKey: .numberOfTrucksPerBag)
        } else {
            self.numberOfTrucksPerBag = nil
        }
        if container.contains(.lotSizeWetTonnes) {
            self.lotSizeWetTonnes = try container.decode(Int.self, forKey: .lotSizeWetTonnes)
        } else {
            self.lotSizeWetTonnes = nil
        }
        if container.contains(.sublotSizeWetTonnes) {
            self.sublotSizeWetTonnes = try container.decode(Int?.self, forKey: .sublotSizeWetTonnes)
        } else {
            self.sublotSizeWetTonnes = nil
        }
        if container.contains(.numberOfLots) {
            self.numberOfLots = try container.decode(Int.self, forKey: .numberOfLots)
        } else {
            self.numberOfLots = nil
        }
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

    public var isEmpty: Bool {
        samplingCompanyID == nil &&
            siteID == nil &&
            location == nil &&
            samplingPointID == nil &&
            startTime == nil &&
            finishTime == nil &&
            methodID == nil &&
            sampleIncrementsWetTonnes == nil &&
            typicalSampleWeightKilograms == nil &&
            numberOfTrucksPerBag == nil &&
            lotSizeWetTonnes == nil &&
            sublotSizeWetTonnes == nil &&
            numberOfLots == nil
    }
}

// MARK: DTO

public struct SampleCollectionDTO: SampleCollectionProperties, Codable, Hashable, APIResponseItem, Sendable {
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

public struct PartialSampleCollectionDTO: SampleCollectionPartialProperties, Codable, Hashable, APIResponseItem, Partial, Sendable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SampleCollectionCodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.version = try container.decode(Date.self, forKey: .version)
        if container.contains(.samplingCompanyID) {
            self.samplingCompanyID = try container.decode(Int.self, forKey: .samplingCompanyID)
        } else {
            self.samplingCompanyID = nil
        }
        if container.contains(.siteID) {
            self.siteID = try container.decode(Int.self, forKey: .siteID)
        } else {
            self.siteID = nil
        }
        if container.contains(.location) {
            self.location = try container.decode(LocationDTO.self, forKey: .location)
        } else {
            self.location = nil
        }
        if container.contains(.samplingPointID) {
            self.samplingPointID = try container.decode(Int.self, forKey: .samplingPointID)
        } else {
            self.samplingPointID = nil
        }
        if container.contains(.startTime) {
            self.startTime = try container.decode(Date.self, forKey: .startTime)
        } else {
            self.startTime = nil
        }
        if container.contains(.finishTime) {
            self.finishTime = try container.decode(Date.self, forKey: .finishTime)
        } else {
            self.finishTime = nil
        }
        if container.contains(.methodID) {
            self.methodID = try container.decode(Int.self, forKey: .methodID)
        } else {
            self.methodID = nil
        }
        if container.contains(.sampleIncrementsWetTonnes) {
            self.sampleIncrementsWetTonnes = try container.decode(Double.self, forKey: .sampleIncrementsWetTonnes)
        } else {
            self.sampleIncrementsWetTonnes = nil
        }
        if container.contains(.typicalSampleWeightKilograms) {
            self.typicalSampleWeightKilograms = try container.decode(Double.self, forKey: .typicalSampleWeightKilograms)
        } else {
            self.typicalSampleWeightKilograms = nil
        }
        if container.contains(.numberOfTrucksPerBag) {
            self.numberOfTrucksPerBag = try container.decode(Int?.self, forKey: .numberOfTrucksPerBag)
        } else {
            self.numberOfTrucksPerBag = nil
        }
        if container.contains(.lotSizeWetTonnes) {
            self.lotSizeWetTonnes = try container.decode(Int.self, forKey: .lotSizeWetTonnes)
        } else {
            self.lotSizeWetTonnes = nil
        }
        if container.contains(.sublotSizeWetTonnes) {
            self.sublotSizeWetTonnes = try container.decode(Int?.self, forKey: .sublotSizeWetTonnes)
        } else {
            self.sublotSizeWetTonnes = nil
        }
        if container.contains(.numberOfLots) {
            self.numberOfLots = try container.decode(Int.self, forKey: .numberOfLots)
        } else {
            self.numberOfLots = nil
        }
    }

    public var isEmpty: Bool {
        samplingCompanyID == nil &&
            siteID == nil &&
            location == nil &&
            samplingPointID == nil &&
            startTime == nil &&
            finishTime == nil &&
            methodID == nil &&
            sampleIncrementsWetTonnes == nil &&
            typicalSampleWeightKilograms == nil &&
            numberOfTrucksPerBag == nil &&
            lotSizeWetTonnes == nil &&
            sublotSizeWetTonnes == nil &&
            numberOfLots == nil
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
    var screening: QualityLotScreening? { get }
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
    var screening: QualityLotScreening?? { get }
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

// MARK: CodingKeys

private enum SamplePreparationCodingKeys: String, CodingKey {
    case id
    case version
    case preparationCompanyID
    case siteID
    case location
    case startTime
    case finishTime
    case standardsID
    case screening
    case sampleChargeWeightGrams
    case pulverizerID
    case pulverizingDurationSeconds
    case divisionMethodID
    case rsdNumberOfSegments
    case incrementISOScoopUsed
    case incrementBackingPlateUsed
    case incrementDividedToExtinction
    case riffleApertureMillimetres
    case numberOfSets
    case transparencyID
}

// MARK: CreationRequest

public struct SamplePreparationCreationRequest: SamplePreparationProperties, Codable, Hashable, Sendable {
    public var preparationCompanyID: Int
    public var siteID: Int
    public var location: LocationDTO
    public var startTime: Date
    public var finishTime: Date
    public var standardsID: Int
    public var screening: QualityLotScreening?
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
        screening: QualityLotScreening?,
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
        self.screening = screening
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
            let screening = mutationRequest.screening,
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
        self.screening = screening
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

public struct SamplePreparationMutationRequest: SamplePreparationPartialProperties, PartialMutationRequest, MutationRequest, Codable, Hashable, Sendable {
    public var preparationCompanyID: Int?
    public var siteID: Int?
    public var location: LocationDTO?
    public var startTime: Date?
    public var finishTime: Date?
    public var standardsID: Int?
    public var screening: QualityLotScreening??
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
        screening: QualityLotScreening?? = nil,
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
        self.screening = screening
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SamplePreparationCodingKeys.self)
        if container.contains(.preparationCompanyID) {
            self.preparationCompanyID = try container.decode(Int.self, forKey: .preparationCompanyID)
        } else {
            self.preparationCompanyID = nil
        }
        if container.contains(.siteID) {
            self.siteID = try container.decode(Int.self, forKey: .siteID)
        } else {
            self.siteID = nil
        }
        if container.contains(.location) {
            self.location = try container.decode(LocationDTO.self, forKey: .location)
        } else {
            self.location = nil
        }
        if container.contains(.startTime) {
            self.startTime = try container.decode(Date.self, forKey: .startTime)
        } else {
            self.startTime = nil
        }
        if container.contains(.finishTime) {
            self.finishTime = try container.decode(Date.self, forKey: .finishTime)
        } else {
            self.finishTime = nil
        }
        if container.contains(.standardsID) {
            self.standardsID = try container.decode(Int.self, forKey: .standardsID)
        } else {
            self.standardsID = nil
        }
        if container.contains(.screening) {
            self.screening = try container.decode(QualityLotScreening?.self, forKey: .screening)
        } else {
            self.screening = nil
        }
        if container.contains(.sampleChargeWeightGrams) {
            self.sampleChargeWeightGrams = try container.decode(Int.self, forKey: .sampleChargeWeightGrams)
        } else {
            self.sampleChargeWeightGrams = nil
        }
        if container.contains(.pulverizerID) {
            self.pulverizerID = try container.decode(Int.self, forKey: .pulverizerID)
        } else {
            self.pulverizerID = nil
        }
        if container.contains(.pulverizingDurationSeconds) {
            self.pulverizingDurationSeconds = try container.decode(TimeInterval.self, forKey: .pulverizingDurationSeconds)
        } else {
            self.pulverizingDurationSeconds = nil
        }
        if container.contains(.divisionMethodID) {
            self.divisionMethodID = try container.decode(Int.self, forKey: .divisionMethodID)
        } else {
            self.divisionMethodID = nil
        }
        if container.contains(.rsdNumberOfSegments) {
            self.rsdNumberOfSegments = try container.decode(Int?.self, forKey: .rsdNumberOfSegments)
        } else {
            self.rsdNumberOfSegments = nil
        }
        if container.contains(.incrementISOScoopUsed) {
            self.incrementISOScoopUsed = try container.decode(Bool?.self, forKey: .incrementISOScoopUsed)
        } else {
            self.incrementISOScoopUsed = nil
        }
        if container.contains(.incrementBackingPlateUsed) {
            self.incrementBackingPlateUsed = try container.decode(Bool?.self, forKey: .incrementBackingPlateUsed)
        } else {
            self.incrementBackingPlateUsed = nil
        }
        if container.contains(.incrementDividedToExtinction) {
            self.incrementDividedToExtinction = try container.decode(Bool?.self, forKey: .incrementDividedToExtinction)
        } else {
            self.incrementDividedToExtinction = nil
        }
        if container.contains(.riffleApertureMillimetres) {
            self.riffleApertureMillimetres = try container.decode(Int?.self, forKey: .riffleApertureMillimetres)
        } else {
            self.riffleApertureMillimetres = nil
        }
        if container.contains(.numberOfSets) {
            self.numberOfSets = try container.decode(Int.self, forKey: .numberOfSets)
        } else {
            self.numberOfSets = nil
        }
        if container.contains(.transparencyID) {
            self.transparencyID = try container.decode(Int.self, forKey: .transparencyID)
        } else {
            self.transparencyID = nil
        }
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
        if let screening = keyAndValues["screening"] as? QualityLotScreening? {
            self.screening = screening
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
        if let updatedValue = other.screening {
            screening = updatedValue
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

    public var isEmpty: Bool {
        preparationCompanyID == nil &&
            siteID == nil &&
            location == nil &&
            startTime == nil &&
            finishTime == nil &&
            standardsID == nil &&
            screening == nil &&
            sampleChargeWeightGrams == nil &&
            pulverizerID == nil &&
            pulverizingDurationSeconds == nil &&
            divisionMethodID == nil &&
            rsdNumberOfSegments == nil &&
            incrementISOScoopUsed == nil &&
            incrementBackingPlateUsed == nil &&
            incrementDividedToExtinction == nil &&
            riffleApertureMillimetres == nil &&
            numberOfSets == nil &&
            transparencyID == nil
    }
}

// MARK: DTO

public struct SamplePreparationDTO: SamplePreparationProperties, Codable, Hashable, APIResponseItem, Sendable {
    public let id: UUID
    public let version: Date
    public let preparationCompanyID: Int
    public let siteID: Int
    public let location: LocationDTO
    public let startTime: Date
    public let finishTime: Date
    public let standardsID: Int
    public let screening: QualityLotScreening?
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
        screening: QualityLotScreening?,
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
        self.screening = screening
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
            let screening = partial.screening,
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
        self.screening = screening
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
        self.screening = creationRequest.screening
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

public struct PartialSamplePreparationDTO: SamplePreparationPartialProperties, Codable, Hashable, APIResponseItem, Partial, Sendable {
    public let id: UUID
    public let version: Date
    public let preparationCompanyID: Int?
    public let siteID: Int?
    public let location: LocationDTO?
    public let startTime: Date?
    public let finishTime: Date?
    public let standardsID: Int?
    public let screening: QualityLotScreening??
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
        screening: QualityLotScreening?? = nil,
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
        self.screening = screening
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
        self.screening = other.screening
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SamplePreparationCodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.version = try container.decode(Date.self, forKey: .version)
        if container.contains(.preparationCompanyID) {
            self.preparationCompanyID = try container.decode(Int.self, forKey: .preparationCompanyID)
        } else {
            self.preparationCompanyID = nil
        }
        if container.contains(.siteID) {
            self.siteID = try container.decode(Int.self, forKey: .siteID)
        } else {
            self.siteID = nil
        }
        if container.contains(.location) {
            self.location = try container.decode(LocationDTO.self, forKey: .location)
        } else {
            self.location = nil
        }
        if container.contains(.startTime) {
            self.startTime = try container.decode(Date.self, forKey: .startTime)
        } else {
            self.startTime = nil
        }
        if container.contains(.finishTime) {
            self.finishTime = try container.decode(Date.self, forKey: .finishTime)
        } else {
            self.finishTime = nil
        }
        if container.contains(.standardsID) {
            self.standardsID = try container.decode(Int.self, forKey: .standardsID)
        } else {
            self.standardsID = nil
        }
        if container.contains(.screening) {
            self.screening = try container.decode(QualityLotScreening?.self, forKey: .screening)
        } else {
            self.screening = nil
        }
        if container.contains(.sampleChargeWeightGrams) {
            self.sampleChargeWeightGrams = try container.decode(Int.self, forKey: .sampleChargeWeightGrams)
        } else {
            self.sampleChargeWeightGrams = nil
        }
        if container.contains(.pulverizerID) {
            self.pulverizerID = try container.decode(Int.self, forKey: .pulverizerID)
        } else {
            self.pulverizerID = nil
        }
        if container.contains(.pulverizingDurationSeconds) {
            self.pulverizingDurationSeconds = try container.decode(TimeInterval.self, forKey: .pulverizingDurationSeconds)
        } else {
            self.pulverizingDurationSeconds = nil
        }
        if container.contains(.divisionMethodID) {
            self.divisionMethodID = try container.decode(Int.self, forKey: .divisionMethodID)
        } else {
            self.divisionMethodID = nil
        }
        if container.contains(.rsdNumberOfSegments) {
            self.rsdNumberOfSegments = try container.decode(Int?.self, forKey: .rsdNumberOfSegments)
        } else {
            self.rsdNumberOfSegments = nil
        }
        if container.contains(.incrementISOScoopUsed) {
            self.incrementISOScoopUsed = try container.decode(Bool?.self, forKey: .incrementISOScoopUsed)
        } else {
            self.incrementISOScoopUsed = nil
        }
        if container.contains(.incrementBackingPlateUsed) {
            self.incrementBackingPlateUsed = try container.decode(Bool?.self, forKey: .incrementBackingPlateUsed)
        } else {
            self.incrementBackingPlateUsed = nil
        }
        if container.contains(.incrementDividedToExtinction) {
            self.incrementDividedToExtinction = try container.decode(Bool?.self, forKey: .incrementDividedToExtinction)
        } else {
            self.incrementDividedToExtinction = nil
        }
        if container.contains(.riffleApertureMillimetres) {
            self.riffleApertureMillimetres = try container.decode(Int?.self, forKey: .riffleApertureMillimetres)
        } else {
            self.riffleApertureMillimetres = nil
        }
        if container.contains(.numberOfSets) {
            self.numberOfSets = try container.decode(Int.self, forKey: .numberOfSets)
        } else {
            self.numberOfSets = nil
        }
        if container.contains(.transparencyID) {
            self.transparencyID = try container.decode(Int.self, forKey: .transparencyID)
        } else {
            self.transparencyID = nil
        }
    }

    public var isEmpty: Bool {
        preparationCompanyID == nil &&
            siteID == nil &&
            location == nil &&
            startTime == nil &&
            finishTime == nil &&
            standardsID == nil &&
            screening == nil &&
            sampleChargeWeightGrams == nil &&
            pulverizerID == nil &&
            pulverizingDurationSeconds == nil &&
            divisionMethodID == nil &&
            rsdNumberOfSegments == nil &&
            incrementISOScoopUsed == nil &&
            incrementBackingPlateUsed == nil &&
            incrementDividedToExtinction == nil &&
            riffleApertureMillimetres == nil &&
            numberOfSets == nil &&
            transparencyID == nil
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
            screening: other.screening ?? screening,
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

// MARK: CodingKeys

private enum SampleReductionCodingKeys: String, CodingKey {
    case id
    case version
    case samplingCompanyID
    case location
    case siteID
    case laboratoryID
    case reductionPointID
    case startTime
    case finishTime
    case screenApertureMillimetres
    case wasConedAndQuartered
    case methodID
    case gridSizeID
}

// MARK: CreationRequest

public struct SampleReductionCreationRequest: SampleReductionProperties, Codable, Hashable, Sendable {
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

public struct SampleReductionMutationRequest: SampleReductionPartialProperties, PartialMutationRequest, MutationRequest, Codable, Hashable, Sendable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SampleReductionCodingKeys.self)
        if container.contains(.samplingCompanyID) {
            self.samplingCompanyID = try container.decode(Int.self, forKey: .samplingCompanyID)
        } else {
            self.samplingCompanyID = nil
        }
        if container.contains(.location) {
            self.location = try container.decode(LocationDTO.self, forKey: .location)
        } else {
            self.location = nil
        }
        if container.contains(.siteID) {
            self.siteID = try container.decode(Int.self, forKey: .siteID)
        } else {
            self.siteID = nil
        }
        if container.contains(.laboratoryID) {
            self.laboratoryID = try container.decode(Int?.self, forKey: .laboratoryID)
        } else {
            self.laboratoryID = nil
        }
        if container.contains(.reductionPointID) {
            self.reductionPointID = try container.decode(Int.self, forKey: .reductionPointID)
        } else {
            self.reductionPointID = nil
        }
        if container.contains(.startTime) {
            self.startTime = try container.decode(Date.self, forKey: .startTime)
        } else {
            self.startTime = nil
        }
        if container.contains(.finishTime) {
            self.finishTime = try container.decode(Date.self, forKey: .finishTime)
        } else {
            self.finishTime = nil
        }
        if container.contains(.screenApertureMillimetres) {
            self.screenApertureMillimetres = try container.decode(Double?.self, forKey: .screenApertureMillimetres)
        } else {
            self.screenApertureMillimetres = nil
        }
        if container.contains(.wasConedAndQuartered) {
            self.wasConedAndQuartered = try container.decode(Bool.self, forKey: .wasConedAndQuartered)
        } else {
            self.wasConedAndQuartered = nil
        }
        if container.contains(.methodID) {
            self.methodID = try container.decode(Int.self, forKey: .methodID)
        } else {
            self.methodID = nil
        }
        if container.contains(.gridSizeID) {
            self.gridSizeID = try container.decode(Int?.self, forKey: .gridSizeID)
        } else {
            self.gridSizeID = nil
        }
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

    public var isEmpty: Bool {
        samplingCompanyID == nil &&
            location == nil &&
            siteID == nil &&
            laboratoryID == nil &&
            reductionPointID == nil &&
            startTime == nil &&
            finishTime == nil &&
            screenApertureMillimetres == nil &&
            wasConedAndQuartered == nil &&
            methodID == nil &&
            gridSizeID == nil
    }
}

// MARK: DTO

public struct SampleReductionDTO: SampleReductionProperties, Codable, Hashable, APIResponseItem, Sendable {
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

public struct PartialSampleReductionDTO: SampleReductionPartialProperties, Codable, Hashable, APIResponseItem, Partial, Sendable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SampleReductionCodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.version = try container.decode(Date.self, forKey: .version)
        if container.contains(.samplingCompanyID) {
            self.samplingCompanyID = try container.decode(Int.self, forKey: .samplingCompanyID)
        } else {
            self.samplingCompanyID = nil
        }
        if container.contains(.location) {
            self.location = try container.decode(LocationDTO.self, forKey: .location)
        } else {
            self.location = nil
        }
        if container.contains(.siteID) {
            self.siteID = try container.decode(Int.self, forKey: .siteID)
        } else {
            self.siteID = nil
        }
        if container.contains(.laboratoryID) {
            self.laboratoryID = try container.decode(Int?.self, forKey: .laboratoryID)
        } else {
            self.laboratoryID = nil
        }
        if container.contains(.reductionPointID) {
            self.reductionPointID = try container.decode(Int.self, forKey: .reductionPointID)
        } else {
            self.reductionPointID = nil
        }
        if container.contains(.startTime) {
            self.startTime = try container.decode(Date.self, forKey: .startTime)
        } else {
            self.startTime = nil
        }
        if container.contains(.finishTime) {
            self.finishTime = try container.decode(Date.self, forKey: .finishTime)
        } else {
            self.finishTime = nil
        }
        if container.contains(.screenApertureMillimetres) {
            self.screenApertureMillimetres = try container.decode(Double?.self, forKey: .screenApertureMillimetres)
        } else {
            self.screenApertureMillimetres = nil
        }
        if container.contains(.wasConedAndQuartered) {
            self.wasConedAndQuartered = try container.decode(Bool.self, forKey: .wasConedAndQuartered)
        } else {
            self.wasConedAndQuartered = nil
        }
        if container.contains(.methodID) {
            self.methodID = try container.decode(Int.self, forKey: .methodID)
        } else {
            self.methodID = nil
        }
        if container.contains(.gridSizeID) {
            self.gridSizeID = try container.decode(Int?.self, forKey: .gridSizeID)
        } else {
            self.gridSizeID = nil
        }
    }

    public var isEmpty: Bool {
        samplingCompanyID == nil &&
            location == nil &&
            siteID == nil &&
            laboratoryID == nil &&
            reductionPointID == nil &&
            startTime == nil &&
            finishTime == nil &&
            screenApertureMillimetres == nil &&
            wasConedAndQuartered == nil &&
            methodID == nil &&
            gridSizeID == nil
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

// MARK: CodingKeys

private enum ShipmentDetailsCodingKeys: String, CodingKey {
    case id
    case version
    case creationDate
    case clientReference
    case logDate
    case norTime
    case vesselName
    case clientID
    case commodityID
    case agentID
    case traderID
    case smelterID
    case dischargePortID
    case inspectionCompanyReceiverID
    case inspectionCompanySellerID
    case inspectionCompanySecondAgentID
    case conradTeamSize
}

// MARK: CreationRequest

public struct ShipmentCreationRequest: ShipmentDetailsProperties, Codable, Hashable, Sendable {
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

public struct ShipmentDetailsMutationRequest: ShipmentDetailsPartialProperties, PartialMutationRequest, MutationRequest, Codable, Hashable, Sendable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ShipmentDetailsCodingKeys.self)
        if container.contains(.clientReference) {
            self.clientReference = try container.decode(String.self, forKey: .clientReference)
        } else {
            self.clientReference = nil
        }
        if container.contains(.logDate) {
            self.logDate = try container.decode(Date.self, forKey: .logDate)
        } else {
            self.logDate = nil
        }
        if container.contains(.norTime) {
            self.norTime = try container.decode(Date.self, forKey: .norTime)
        } else {
            self.norTime = nil
        }
        if container.contains(.vesselName) {
            self.vesselName = try container.decode(String.self, forKey: .vesselName)
        } else {
            self.vesselName = nil
        }
        if container.contains(.clientID) {
            self.clientID = try container.decode(Int.self, forKey: .clientID)
        } else {
            self.clientID = nil
        }
        if container.contains(.commodityID) {
            self.commodityID = try container.decode(Int.self, forKey: .commodityID)
        } else {
            self.commodityID = nil
        }
        if container.contains(.agentID) {
            self.agentID = try container.decode(Int?.self, forKey: .agentID)
        } else {
            self.agentID = nil
        }
        if container.contains(.traderID) {
            self.traderID = try container.decode(Int?.self, forKey: .traderID)
        } else {
            self.traderID = nil
        }
        if container.contains(.smelterID) {
            self.smelterID = try container.decode(Int.self, forKey: .smelterID)
        } else {
            self.smelterID = nil
        }
        if container.contains(.dischargePortID) {
            self.dischargePortID = try container.decode(Int.self, forKey: .dischargePortID)
        } else {
            self.dischargePortID = nil
        }
        if container.contains(.inspectionCompanyReceiverID) {
            self.inspectionCompanyReceiverID = try container.decode(Int?.self, forKey: .inspectionCompanyReceiverID)
        } else {
            self.inspectionCompanyReceiverID = nil
        }
        if container.contains(.inspectionCompanySellerID) {
            self.inspectionCompanySellerID = try container.decode(Int?.self, forKey: .inspectionCompanySellerID)
        } else {
            self.inspectionCompanySellerID = nil
        }
        if container.contains(.inspectionCompanySecondAgentID) {
            self.inspectionCompanySecondAgentID = try container.decode(Int?.self, forKey: .inspectionCompanySecondAgentID)
        } else {
            self.inspectionCompanySecondAgentID = nil
        }
        if container.contains(.conradTeamSize) {
            self.conradTeamSize = try container.decode(Int.self, forKey: .conradTeamSize)
        } else {
            self.conradTeamSize = nil
        }
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

    public var isEmpty: Bool {
        clientReference == nil &&
            logDate == nil &&
            norTime == nil &&
            vesselName == nil &&
            clientID == nil &&
            commodityID == nil &&
            agentID == nil &&
            traderID == nil &&
            smelterID == nil &&
            dischargePortID == nil &&
            inspectionCompanyReceiverID == nil &&
            inspectionCompanySellerID == nil &&
            inspectionCompanySecondAgentID == nil &&
            conradTeamSize == nil
    }
}

// MARK: DTO

public struct ShipmentDetailsDTO: ShipmentDetailsProperties, Codable, Hashable, APIResponseItem, Sendable {
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

public struct PartialShipmentDetailsDTO: ShipmentDetailsPartialProperties, Codable, Hashable, APIResponseItem, Partial, Sendable {
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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ShipmentDetailsCodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.version = try container.decode(Date.self, forKey: .version)
        if container.contains(.creationDate) {
            self.creationDate = try container.decode(Date.self, forKey: .creationDate)
        } else {
            self.creationDate = nil
        }
        if container.contains(.clientReference) {
            self.clientReference = try container.decode(String.self, forKey: .clientReference)
        } else {
            self.clientReference = nil
        }
        if container.contains(.logDate) {
            self.logDate = try container.decode(Date.self, forKey: .logDate)
        } else {
            self.logDate = nil
        }
        if container.contains(.norTime) {
            self.norTime = try container.decode(Date.self, forKey: .norTime)
        } else {
            self.norTime = nil
        }
        if container.contains(.vesselName) {
            self.vesselName = try container.decode(String.self, forKey: .vesselName)
        } else {
            self.vesselName = nil
        }
        if container.contains(.clientID) {
            self.clientID = try container.decode(Int.self, forKey: .clientID)
        } else {
            self.clientID = nil
        }
        if container.contains(.commodityID) {
            self.commodityID = try container.decode(Int.self, forKey: .commodityID)
        } else {
            self.commodityID = nil
        }
        if container.contains(.agentID) {
            self.agentID = try container.decode(Int?.self, forKey: .agentID)
        } else {
            self.agentID = nil
        }
        if container.contains(.traderID) {
            self.traderID = try container.decode(Int?.self, forKey: .traderID)
        } else {
            self.traderID = nil
        }
        if container.contains(.smelterID) {
            self.smelterID = try container.decode(Int.self, forKey: .smelterID)
        } else {
            self.smelterID = nil
        }
        if container.contains(.dischargePortID) {
            self.dischargePortID = try container.decode(Int.self, forKey: .dischargePortID)
        } else {
            self.dischargePortID = nil
        }
        if container.contains(.inspectionCompanyReceiverID) {
            self.inspectionCompanyReceiverID = try container.decode(Int?.self, forKey: .inspectionCompanyReceiverID)
        } else {
            self.inspectionCompanyReceiverID = nil
        }
        if container.contains(.inspectionCompanySellerID) {
            self.inspectionCompanySellerID = try container.decode(Int?.self, forKey: .inspectionCompanySellerID)
        } else {
            self.inspectionCompanySellerID = nil
        }
        if container.contains(.inspectionCompanySecondAgentID) {
            self.inspectionCompanySecondAgentID = try container.decode(Int?.self, forKey: .inspectionCompanySecondAgentID)
        } else {
            self.inspectionCompanySecondAgentID = nil
        }
        if container.contains(.conradTeamSize) {
            self.conradTeamSize = try container.decode(Int.self, forKey: .conradTeamSize)
        } else {
            self.conradTeamSize = nil
        }
    }

    public var isEmpty: Bool {
        creationDate == nil &&
            clientReference == nil &&
            logDate == nil &&
            norTime == nil &&
            vesselName == nil &&
            clientID == nil &&
            commodityID == nil &&
            agentID == nil &&
            traderID == nil &&
            smelterID == nil &&
            dischargePortID == nil &&
            inspectionCompanyReceiverID == nil &&
            inspectionCompanySellerID == nil &&
            inspectionCompanySecondAgentID == nil &&
            conradTeamSize == nil
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

public struct AgentValue: SimpleConfigurationConstantValue, Sendable {
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

public struct ClientValue: SimpleConfigurationConstantValue, Sendable {
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

public struct CommodityValue: SimpleConfigurationConstantValue, Sendable {
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

public struct DischargeGearValue: SimpleConfigurationConstantValue, Sendable {
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

public struct DischargeMethodValue: SimpleConfigurationConstantValue, Sendable {
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

public struct DischargeWeatherConditionValue: SimpleConfigurationConstantValue, Sendable {
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

public struct DischargeWeightWeighingPointValue: SimpleConfigurationConstantValue, Sendable {
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

public struct InspectionCompanyValue: SimpleConfigurationConstantValue, Sendable {
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

public struct MaritimePortValue: ConfigurationConstantValue, Sendable {
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

public struct SampleCollectionMethodValue: SimpleConfigurationConstantValue, Sendable {
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

public struct SampleCollectionPointValue: ConfigurationConstantValue, Sendable {
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

public struct SamplePreparationDivisionMethodValue: ConfigurationConstantValue, Sendable {
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

public struct SamplePreparationPulverizerValue: SimpleConfigurationConstantValue, Sendable {
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

public struct SamplePreparationScreenApertureValue: SimpleConfigurationConstantValue, Sendable {
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

public struct SamplePreparationStandardValue: SimpleConfigurationConstantValue, Sendable {
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

public struct SampleReductionGridSizeValue: SimpleConfigurationConstantValue, Sendable {
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

public struct SampleReductionLaboratoryValue: SimpleConfigurationConstantValue, Sendable {
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

public struct SampleReductionMethodValue: ConfigurationConstantValue, Sendable {
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

public struct SampleReductionPointValue: SimpleConfigurationConstantValue, Sendable {
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

public struct SampleReductionSiteValue: ConfigurationConstantValue, Sendable {
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

public struct SamplingCompanyValue: SimpleConfigurationConstantValue, Sendable {
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

public struct SamplingSiteValue: SimpleConfigurationConstantValue, Sendable {
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

public struct SamplingTransparencyValue: ConfigurationConstantValue, Sendable {
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

public struct SmelterValue: SimpleConfigurationConstantValue, Sendable {
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

public struct TraderValue: SimpleConfigurationConstantValue, Sendable {
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

public struct WeighingMethodValue: ConfigurationConstantValue, Sendable {
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

public struct ConfigurationConstants: Codable, Sendable {
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

public enum ShipmentPart: String, LosslessStringConvertible, Codable, Sendable {
    case billOfLading = "bill_of_lading"
    case discharge
    case dischargeWeight = "discharge_weight"
    case moistureDetermination = "moisture_determination"
    case sampleCollection = "sample_collection"
    case samplePreparation = "sample_preparation"
    case sampleReduction = "sample_reduction"
    case details

    public init?(_ description: String) {
        self.init(rawValue: description)
    }

    public var description: String { rawValue }
}
