//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

// MARK: - BillOfLading

// MARK: CreationRequest

public struct BillOfLadingCreationRequest: Codable, Hashable {
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
}

// MARK: MutationRequest

public struct BillOfLadingMutationRequest: Codable, Hashable {
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
}

// MARK: DTO

public struct BillOfLadingDTO: Codable, Hashable, APIResponseItem {
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
}

// MARK: PartialDTO

public struct PartialBillOfLadingDTO: Codable, Hashable {
    public let id: UUID?
    public let version: Date
    public let loadPortID: Int?
    public let vesselHolds: Set<Int>?
    public let weighingMethodID: Int?
    public let wetMetricTonnes: Double?
    public let moisturePercentage: Double?
    public let dryMetricTonnes: Double?

    public init(
        id: UUID? = nil,
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
}

// MARK: - Discharge

// MARK: CreationRequest

public struct DischargeCreationRequest: Codable, Hashable {
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
}

// MARK: MutationRequest

public struct DischargeMutationRequest: Codable, Hashable {
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
}

// MARK: DTO

public struct DischargeDTO: Codable, Hashable, APIResponseItem {
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
}

// MARK: PartialDTO

public struct PartialDischargeDTO: Codable, Hashable {
    public let id: UUID?
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
        id: UUID? = nil,
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
}

// MARK: - DischargeWeight

// MARK: CreationRequest

public struct DischargeWeightCreationRequest: Codable, Hashable {
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
}

// MARK: MutationRequest

public struct DischargeWeightMutationRequest: Codable, Hashable {
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
}

// MARK: DTO

public struct DischargeWeightDTO: Codable, Hashable, APIResponseItem {
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
}

// MARK: PartialDTO

public struct PartialDischargeWeightDTO: Codable, Hashable {
    public let id: UUID?
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
        id: UUID? = nil,
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
}

// MARK: - MoistureDetermination

// MARK: CreationRequest

public struct MoistureDeterminationCreationRequest: Codable, Hashable {
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
}

// MARK: MutationRequest

public struct MoistureDeterminationMutationRequest: Codable, Hashable {
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
}

// MARK: DTO

public struct MoistureDeterminationDTO: Codable, Hashable, APIResponseItem {
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
}

// MARK: PartialDTO

public struct PartialMoistureDeterminationDTO: Codable, Hashable {
    public let id: UUID?
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
        id: UUID? = nil,
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
}

// MARK: - SampleCollection

// MARK: CreationRequest

public struct SampleCollectionCreationRequest: Codable, Hashable {
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
}

// MARK: MutationRequest

public struct SampleCollectionMutationRequest: Codable, Hashable {
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
}

// MARK: DTO

public struct SampleCollectionDTO: Codable, Hashable, APIResponseItem {
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
}

// MARK: PartialDTO

public struct PartialSampleCollectionDTO: Codable, Hashable {
    public let id: UUID?
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
        id: UUID? = nil,
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
}

// MARK: - SamplePreparation

// MARK: CreationRequest

public struct SamplePreparationCreationRequest: Codable, Hashable {
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
}

// MARK: MutationRequest

public struct SamplePreparationMutationRequest: Codable, Hashable {
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
}

// MARK: DTO

public struct SamplePreparationDTO: Codable, Hashable, APIResponseItem {
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
}

// MARK: PartialDTO

public struct PartialSamplePreparationDTO: Codable, Hashable {
    public let id: UUID?
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
        id: UUID? = nil,
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
}

// MARK: - SampleReduction

// MARK: CreationRequest

public struct SampleReductionCreationRequest: Codable, Hashable {
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
}

// MARK: MutationRequest

public struct SampleReductionMutationRequest: Codable, Hashable {
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
}

// MARK: DTO

public struct SampleReductionDTO: Codable, Hashable, APIResponseItem {
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
}

// MARK: PartialDTO

public struct PartialSampleReductionDTO: Codable, Hashable {
    public let id: UUID?
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
        id: UUID? = nil,
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
}

// MARK: - ShipmentDetails

// MARK: CreationRequest

public struct ShipmentDetailsCreationRequest: Codable, Hashable {
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
}

// MARK: MutationRequest

public struct ShipmentDetailsMutationRequest: Codable, Hashable {
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
}

// MARK: DTO

public struct ShipmentDetailsDTO: Codable, Hashable, APIResponseItem {
    public let id: UUID
    public let version: Date
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

// MARK: PartialDTO

public struct PartialShipmentDetailsDTO: Codable, Hashable {
    public let id: UUID?
    public let version: Date
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
        id: UUID? = nil,
        version: Date,
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
