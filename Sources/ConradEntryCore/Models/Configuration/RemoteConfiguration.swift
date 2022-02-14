//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public struct RemoteConfiguration: Codable {
    public init(agents: [SimpleConstant], commodities: [SimpleConstant], dischargeGear: [SimpleConstant], dischargeMethods: [SimpleConstant], dischargeWeatherConditions: [SimpleConstant], dischargeWeightWeighingPoints: [SimpleConstant], smelters: [SimpleConstant], inspectionCompanies: [SimpleConstant], samplingCompanies: [SimpleConstant], sampleReductionLaboratories: [SimpleConstant], sampleReductionPoints: [SimpleConstant], samplePreparationPulverizers: [SimpleConstant], sampleReductionGridSizes: [SimpleConstant], samplePreparationScreenApertures: [SimpleConstant], clients: [SimpleConstant], traders: [SimpleConstant], samplingSites: [SimpleConstant], sampleCollectionMethods: [SimpleConstant], samplePreparationStandards: [SimpleConstant], samplingTransparencies: [SamplingTransparency], sampleCollectionPoints: [SampleCollectionPoint], sampleReductionSites: [SampleReductionSite], sampleReductionMethods: [SampleReductionMethod], samplePreparationDivisionMethods: [SamplePreparationDivisionMethod], weighingMethods: [WeighingMethod], maritimePorts: [MaritimePort]) {
        self.agents = agents
        self.commodities = commodities
        self.smelters = smelters
        self.dischargeGear = dischargeGear
        self.dischargeMethods = dischargeMethods
        self.dischargeWeatherConditions = dischargeWeatherConditions
        self.dischargeWeightWeighingPoints = dischargeWeightWeighingPoints
        self.inspectionCompanies = inspectionCompanies
        self.samplingCompanies = samplingCompanies
        self.sampleReductionSites = sampleReductionSites
        self.sampleReductionLaboratories = sampleReductionLaboratories
        self.sampleReductionPoints = sampleReductionPoints
        self.samplePreparationPulverizers = samplePreparationPulverizers
        self.sampleReductionGridSizes = sampleReductionGridSizes
        self.sampleReductionMethods = sampleReductionMethods
        self.sampleCollectionPoints = sampleCollectionPoints
        self.samplePreparationDivisionMethods = samplePreparationDivisionMethods
        self.samplePreparationScreenApertures = samplePreparationScreenApertures
        self.clients = clients
        self.samplingTransparencies = samplingTransparencies
        self.traders = traders
        self.samplingSites = samplingSites
        self.sampleCollectionMethods = sampleCollectionMethods
        self.samplePreparationStandards = samplePreparationStandards
        self.weighingMethods = weighingMethods
        self.maritimePorts = maritimePorts
    }

    public init() {
        self.agents = []
        self.commodities = []
        self.smelters = []
        self.dischargeGear = []
        self.dischargeMethods = []
        self.dischargeWeatherConditions = []
        self.dischargeWeightWeighingPoints = []
        self.inspectionCompanies = []
        self.samplingCompanies = []
        self.sampleReductionLaboratories = []
        self.sampleReductionPoints = []
        self.samplePreparationPulverizers = []
        self.sampleReductionGridSizes = []
        self.sampleReductionMethods = []
        self.sampleReductionSites = []
        self.sampleCollectionPoints = []
        self.samplePreparationDivisionMethods = []
        self.samplePreparationScreenApertures = []
        self.clients = []
        self.samplingTransparencies = []
        self.traders = []
        self.samplingSites = []
        self.sampleCollectionMethods = []
        self.samplePreparationStandards = []
        self.weighingMethods = []
        self.maritimePorts = []
    }

    public var agents, commodities, dischargeGear, dischargeMethods, dischargeWeatherConditions, dischargeWeightWeighingPoints, smelters, inspectionCompanies, samplingCompanies, sampleReductionLaboratories, sampleReductionPoints, samplePreparationPulverizers, sampleReductionGridSizes, samplePreparationScreenApertures, clients, traders, samplingSites, sampleCollectionMethods, samplePreparationStandards: [SimpleConstant]
    public var sampleCollectionPoints: [SampleCollectionPoint]
    public var sampleReductionSites: [SampleReductionSite]
    public var sampleReductionMethods: [SampleReductionMethod]
    public var samplingTransparencies: [SamplingTransparency]
    public var samplePreparationDivisionMethods: [SamplePreparationDivisionMethod]
    public var weighingMethods: [WeighingMethod]
    public var maritimePorts: [MaritimePort]

    public enum CodingKeys: String, CodingKey, Codable, CaseIterable {
        case agents, commodities, smelters, clients, traders
        case dischargeGear = "discharge_gear"
        case dischargeWeatherConditions = "discharge_weather_conditions"
        case dischargeWeightWeighingPoints = "discharge_weight_weighing_points"
        case maritimePorts = "maritime_ports"
        case dischargeMethods = "discharge_methods"
        case inspectionCompanies = "inspection_companies"
        case samplingCompanies = "sampling_companies"
        case sampleReductionSites = "sample_reduction_sites"
        case sampleReductionLaboratories = "sample_reduction_laboratories"
        case sampleReductionPoints = "sample_reduction_points"
        case samplePreparationPulverizers = "sample_preparation_pulverizers"
        case sampleReductionGridSizes = "sample_reduction_grid_sizes"
        case sampleReductionMethods = "sample_reduction_methods"
        case weighingMethods = "weighing_methods"
        case sampleCollectionPoints = "sample_collection_points"
        case samplePreparationDivisionMethods = "sample_preparation_division_methods"
        case samplePreparationScreenApertures = "sample_preparation_screen_apertures"
        case samplingTransparencies = "sampling_transparencies"
        case samplingSites = "sampling_sites"
        case sampleCollectionMethods = "sample_collection_methods"
        case samplePreparationStandards = "sample_preparation_standards"
    }
}
