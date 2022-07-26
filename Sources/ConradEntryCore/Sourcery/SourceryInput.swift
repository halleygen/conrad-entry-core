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

    private protocol BillOfLadingTemplate: ShipmentAutogen {
        // sourcery:begin: skipMutationRequest, skipCreationRequest, requiredInPartialDTO
        var id: UUID { get }
        var version: Date { get }
        // sourcery:end

        var loadPortID: Int { get }
        var vesselHolds: Set<Int> { get }
        var weighingMethodID: Int { get }
        var wetMetricTonnes: Double { get }
        var moisturePercentage: Double { get }
        var dryMetricTonnes: Double { get }
    }

    private protocol DischargeTemplate: ShipmentAutogen {
        // sourcery:begin: skipMutationRequest, skipCreationRequest, requiredInPartialDTO
        var id: UUID { get }
        var version: Date { get }
        // sourcery:end

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

    private protocol DischargeWeightTemplate: ShipmentAutogen {
        // sourcery:begin: skipMutationRequest, skipCreationRequest, requiredInPartialDTO
        var id: UUID { get }
        var version: Date { get }
        // sourcery:end

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

    private protocol MoistureDeterminationTemplate: ShipmentAutogen {
        // sourcery:begin: skipMutationRequest, skipCreationRequest, requiredInPartialDTO
        var id: UUID { get }
        var version: Date { get }
        // sourcery:end

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

    private protocol SampleCollectionTemplate: ShipmentAutogen {
        // sourcery:begin: skipMutationRequest, skipCreationRequest, requiredInPartialDTO
        var id: UUID { get }
        var version: Date { get }
        // sourcery:end

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

    private protocol SamplePreparationTemplate: ShipmentAutogen {
        // sourcery:begin: skipMutationRequest, skipCreationRequest, requiredInPartialDTO
        var id: UUID { get }
        var version: Date { get }
        // sourcery:end

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

    private protocol SampleReductionTemplate: ShipmentAutogen {
        // sourcery:begin: skipMutationRequest, skipCreationRequest, requiredInPartialDTO
        var id: UUID { get }
        var version: Date { get }
        // sourcery:end

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
