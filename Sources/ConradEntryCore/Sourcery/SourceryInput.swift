//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

#if DEBUG

    import Foundation

    private protocol ShipmentAutogen {}

    private protocol ShipmentDetailsTemplate: ShipmentAutogen {
        // sourcery:begin: skipMutationRequest, skipCreationRequest, requiredInPartialDTO
        var id: UUID { get }
        var version: Date { get }
        // sourcery:end

        // sourcery: skipMutationRequest, skipCreationRequest
        var creationDate: Date { get }

        var clientReference: String { get }
        var logDate: Date { get }
        var norTime: Date { get }
        var vesselName: String { get }
        // sourcery:begin: coreDataType = "Constant"
        var clientID: Int { get }
        var commodityID: Int { get }
        var agentID: Int? { get }
        var traderID: Int? { get }
        var smelterID: Int { get }
        var dischargePortID: Int { get }
        var inspectionCompanyReceiverID: Int? { get }
        var inspectionCompanySellerID: Int? { get }
        var inspectionCompanySecondAgentID: Int? { get }
        // sourcery:end
        // sourcery: coreDataType = "NSNumber.Int"
        var conradTeamSize: Int { get }
    }

    private protocol BillOfLadingTemplate: ShipmentAutogen {
        // sourcery:begin: skipMutationRequest, skipCreationRequest, requiredInPartialDTO
        var id: UUID { get }
        var version: Date { get }
        // sourcery:end

        // sourcery: coreDataType = "Constant"
        var loadPortID: Int { get }
        // sourcery: coreDataType = "NSSet"
        var vesselHolds: Set<Int> { get }
        // sourcery: coreDataType = "Constant"
        var methodID: Int { get }
        // sourcery: coreDataType = "NSNumber.Double"
        var wetMetricTonnes: Double { get }
        // sourcery: coreDataType = "NSNumber.Double"
        var moisturePercentage: Double { get }
        // sourcery: coreDataType = "NSNumber.Double"
        var dryMetricTonnes: Double { get }
    }

    private protocol DischargeTemplate: ShipmentAutogen {
        // sourcery:begin: skipMutationRequest, skipCreationRequest, requiredInPartialDTO
        var id: UUID { get }
        var version: Date { get }
        // sourcery:end

        var berthName: String { get }
        // sourcery: coreDataType = "Location"
        var berthLocation: LocationDTO { get }
        // sourcery: coreDataType = "Constant"
        var gearID: Int { get }
        // sourcery: coreDataType = "Constant"
        var methodID: Int { get }
        var cargoCondition: CargoCondition { get }
        // sourcery: coreDataType = "Constant"
        var weatherConditionsID: Int { get }
        var startTime: Date { get }
        var finishTimeLastGrab: Date { get }
        var finishTimeCleanup: Date { get }
        // sourcery: coreDataType = "NSNumber.Double"
        var dischargeRateTonnesPerHour: Double { get }
        // sourcery: coreDataType = "NSNumber.Bool"
        var saveAllTarpaulinsUsed: Bool { get }
        // sourcery: coreDataType = "NSNumber.Bool"
        var holdsCleaned: Bool { get }
        // sourcery: coreDataType = "NSNumber.Bool"
        var wharfCleaned: Bool { get }
    }

    private protocol DischargeWeightTemplate: ShipmentAutogen {
        // sourcery:begin: skipMutationRequest, skipCreationRequest, requiredInPartialDTO
        var id: UUID { get }
        var version: Date { get }
        // sourcery:end

        // sourcery: coreDataReadOnly
        var kind: DischargeWeightKind { get }
        // sourcery: coreDataType = "Constant"
        var methodID: Int { get }
        // sourcery: coreDataType = "Constant"
        var weighingPointID: Int { get }
        var weighingCompany: String { get }
        var startTime: Date { get }
        var finishTime: Date { get }
        // sourcery: coreDataType = "NSNumber.Double"
        var wetMetricTonnes: Double { get }
        // sourcery: coreDataType = "NSNumber.Double"
        var moisturePercentage: Double { get }
        // sourcery: coreDataType = "NSNumber.Double"
        var dryMetricTonnes: Double { get }
        var equipmentName: String? { get }
        var equipmentModel: String? { get }
        // sourcery: coreDataType = "Location"
        var equipmentLocation: LocationDTO? { get }
        var equipmentCertificationDate: Date? { get }
        var calibrationCheck: CalibrationCheck? { get }
        var abcCheck: ABCCheck? { get }
        var tallymen: Tallymen? { get }
        // sourcery: coreDataType = "Constant"
        var transparencyID: Int { get }
    }

    private protocol MoistureDeterminationTemplate: ShipmentAutogen {
        // sourcery:begin: skipMutationRequest, skipCreationRequest, requiredInPartialDTO
        var id: UUID { get }
        var version: Date { get }
        // sourcery:end

        // sourcery: coreDataType = "Constant"
        var moistureDeterminationCompanyID: Int { get }
        // sourcery: coreDataType = "Constant"
        var siteID: Int { get }
        // sourcery: coreDataType = "Location"
        var location: LocationDTO { get }
        // sourcery: coreDataType = "NSNumber.Double"
        var lotSampleTrayWeightKilograms: Double { get }
        var ovenOnTime: Date { get }
        var ovenOffTime: Date { get }
        // sourcery: coreDataType = "NSNumber.Int"
        var ovenTemperatureCelsius: Int { get }
        var constantWeightCheck: ConstantWeightCheck? { get }
        // sourcery: coreDataType = "NSNumber.Int"
        var resultsWaitTimeDays: Int { get }
        // sourcery: coreDataType = "Constant"
        var transparencyID: Int { get }
    }

    private protocol SampleCollectionTemplate: ShipmentAutogen {
        // sourcery:begin: skipMutationRequest, skipCreationRequest, requiredInPartialDTO
        var id: UUID { get }
        var version: Date { get }
        // sourcery:end

        // sourcery: coreDataType = "Constant"
        var samplingCompanyID: Int { get }
        // sourcery: coreDataType = "Constant"
        var siteID: Int { get }
        // sourcery: coreDataType = "Location"
        var location: LocationDTO { get }
        // sourcery: coreDataType = "Constant"
        var samplingPointID: Int { get }
        var startTime: Date { get }
        var finishTime: Date { get }
        // sourcery: coreDataType = "Constant"
        var methodID: Int { get }
        // sourcery: coreDataType = "NSNumber.Double"
        var sampleIncrementsWetTonnes: Double { get }
        // sourcery: coreDataType = "NSNumber.Double"
        var typicalSampleWeightKilograms: Double { get }
        // sourcery: coreDataType = "NSNumber.Int"
        var numberOfTrucksPerBag: Int? { get }
        // sourcery: coreDataType = "NSNumber.Int"
        var lotSizeWetTonnes: Int { get }
        // sourcery: coreDataType = "NSNumber.Int"
        var sublotSizeWetTonnes: Int? { get }
        // sourcery: coreDataType = "NSNumber.Int"
        var numberOfLots: Int { get }
    }

    private protocol SamplePreparationTemplate: ShipmentAutogen {
        // sourcery:begin: skipMutationRequest, skipCreationRequest, requiredInPartialDTO
        var id: UUID { get }
        var version: Date { get }
        // sourcery:end

        // sourcery: coreDataType = "Constant"
        var preparationCompanyID: Int { get }
        // sourcery: coreDataType = "Constant"
        var siteID: Int { get }
        // sourcery: coreDataType = "Location"
        var location: LocationDTO { get }
        var startTime: Date { get }
        var finishTime: Date { get }
        // sourcery: coreDataType = "Constant"
        var standardsID: Int { get }
        var screening: QualityLotScreening? { get }
        // sourcery: coreDataType = "NSNumber.Int"
        var sampleChargeWeightGrams: Int { get }
        // sourcery: coreDataType = "Constant"
        var pulverizerID: Int { get }
        // sourcery: coreDataType = "NSNumber.Double"
        var pulverizingDurationSeconds: TimeInterval { get }
        // sourcery: coreDataType = "Constant"
        var divisionMethodID: Int { get }
        // sourcery: coreDataType = "NSNumber.Int"
        var rsdNumberOfSegments: Int? { get }
        // sourcery: coreDataType = "NSNumber.Bool"
        var incrementISOScoopUsed: Bool? { get }
        // sourcery: coreDataType = "NSNumber.Bool"
        var incrementBackingPlateUsed: Bool? { get }
        // sourcery: coreDataType = "NSNumber.Bool"
        var incrementDividedToExtinction: Bool? { get }
        // sourcery: coreDataType = "NSNumber.Int"
        var riffleApertureMillimetres: Int? { get }
        // sourcery: coreDataType = "NSNumber.Int"
        var numberOfSets: Int { get }
        // sourcery: coreDataType = "Constant"
        var transparencyID: Int { get }
    }

    private protocol SampleReductionTemplate: ShipmentAutogen {
        // sourcery:begin: skipMutationRequest, skipCreationRequest, requiredInPartialDTO
        var id: UUID { get }
        var version: Date { get }
        // sourcery:end

        // sourcery: coreDataType = "Constant"
        var samplingCompanyID: Int { get }
        // sourcery: coreDataType = "Location"
        var location: LocationDTO { get }
        // sourcery: coreDataType = "Constant"
        var siteID: Int { get }
        // sourcery: coreDataType = "Constant"
        var laboratoryID: Int? { get }
        // sourcery: coreDataType = "Constant"
        var reductionPointID: Int { get }
        var startTime: Date { get }
        var finishTime: Date { get }
        // sourcery: coreDataType = "NSNumber.Double"
        var screenApertureMillimetres: Double? { get }
        // sourcery: coreDataType = "NSNumber.Bool"
        var wasConedAndQuartered: Bool { get }
        // sourcery: coreDataType = "Constant"
        var methodID: Int { get }
        // sourcery: coreDataType = "Constant"
        var gridSizeID: Int? { get }
    }

    // MARK: -

    // MARK: - Constants

    // MARK: -

    private protocol ConstantAutogen {}

    // sourcery:begin: simpleConstant
    private protocol Agent: ConstantAutogen {}
    private protocol Commodity: ConstantAutogen {}
    private protocol DischargeGear: ConstantAutogen {}
    private protocol DischargeMethod: ConstantAutogen {}
    private protocol DischargeWeatherCondition: ConstantAutogen {}
    private protocol DischargeWeightWeighingPoint: ConstantAutogen {}
    private protocol Smelter: ConstantAutogen {}
    private protocol InspectionCompany: ConstantAutogen {}
    private protocol SamplingCompany: ConstantAutogen {}
    private protocol SampleReductionLaboratory: ConstantAutogen {}
    private protocol SampleReductionPoint: ConstantAutogen {}
    private protocol SamplePreparationPulverizer: ConstantAutogen {}
    private protocol SampleReductionGridSize: ConstantAutogen {}
    private protocol SamplePreparationScreenAperture: ConstantAutogen {}
    private protocol Client: ConstantAutogen {}
    private protocol Trader: ConstantAutogen {}
    private protocol SamplingSite: ConstantAutogen {}
    private protocol SampleCollectionMethod: ConstantAutogen {}
    private protocol SamplePreparationStandard: ConstantAutogen {}
    // sourcery:end

    private protocol SampleCollectionPoint: ConstantAutogen {
        var isFromTruck: Bool { get }
    }

    private protocol SampleReductionSite: ConstantAutogen {
        var isLabFacility: Bool { get }
    }

    private protocol SampleReductionMethod: ConstantAutogen {
        var usesGrid: Bool { get }
    }

    private protocol SamplingTransparency: ConstantAutogen {
        var ranking: Int { get }
    }

    private protocol SamplePreparationDivisionMethod: ConstantAutogen {
        var usesRotarySampleDivider: Bool { get }
        var usesRiffle: Bool { get }
        var usesIncrementDivision: Bool { get }
    }

    private protocol WeighingMethod: ConstantAutogen {
        var usesEquipment: Bool { get }
        var usesTallymen: Bool { get }
        var supportsABCChecks: Bool { get }
    }

    private protocol MaritimePort: ConstantAutogen {
        var countryCode: String { get }
        var timeZoneIdentifier: String { get }
    }

#endif
