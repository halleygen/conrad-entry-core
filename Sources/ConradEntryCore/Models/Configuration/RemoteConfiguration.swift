//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

public struct RemoteConfiguration: Codable {
    public init(smelters: [SimpleConstant], dischargeMethods: [SimpleConstant], inspectionCompanies: [SimpleConstant], samplingCompanies: [SimpleConstant], sampleReductionLocations: [SimpleConstant], qualityLotSamplePreparationPulverizers: [SimpleConstant], sampleReductionGridSizes: [SimpleConstant], sampleReductionMethods: [SimpleConstant], qualityLotSamplePreparationDivisionMethods: [SimpleConstant], qualityLotSamplePreparationScreenApertures: [SimpleConstant], clients: [SimpleConstant], traders: [SimpleConstant], samplingLocations: [SimpleConstant], sampleCollectionMethods: [SimpleConstant], qualityLotSamplePreparationMethods: [SimpleConstant], samplingTransparencies: [SamplingTransparency], sampleCollectionPoints: [SampleCollectionPoint], weighingMethods: [WeighingMethod], maritimePorts: [MaritimePort]) {
        self.smelters = smelters
        self.dischargeMethods = dischargeMethods
        self.inspectionCompanies = inspectionCompanies
        self.samplingCompanies = samplingCompanies
        self.sampleReductionLocations = sampleReductionLocations
        self.qualityLotSamplePreparationPulverizers = qualityLotSamplePreparationPulverizers
        self.sampleReductionGridSizes = sampleReductionGridSizes
        self.sampleReductionMethods = sampleReductionMethods
        self.sampleCollectionPoints = sampleCollectionPoints
        self.qualityLotSamplePreparationDivisionMethods = qualityLotSamplePreparationDivisionMethods
        self.qualityLotSamplePreparationScreenApertures = qualityLotSamplePreparationScreenApertures
        self.clients = clients
        self.samplingTransparencies = samplingTransparencies
        self.traders = traders
        self.samplingLocations = samplingLocations
        self.sampleCollectionMethods = sampleCollectionMethods
        self.qualityLotSamplePreparationMethods = qualityLotSamplePreparationMethods
        self.weighingMethods = weighingMethods
        self.maritimePorts = maritimePorts
    }

    public init() {
        self.smelters = []
        self.dischargeMethods = []
        self.inspectionCompanies = []
        self.samplingCompanies = []
        self.sampleReductionLocations = []
        self.qualityLotSamplePreparationPulverizers = []
        self.sampleReductionGridSizes = []
        self.sampleReductionMethods = []
        self.sampleCollectionPoints = []
        self.qualityLotSamplePreparationDivisionMethods = []
        self.qualityLotSamplePreparationScreenApertures = []
        self.clients = []
        self.samplingTransparencies = []
        self.traders = []
        self.samplingLocations = []
        self.sampleCollectionMethods = []
        self.qualityLotSamplePreparationMethods = []
        self.weighingMethods = []
        self.maritimePorts = []
    }

    public var smelters, dischargeMethods, inspectionCompanies, samplingCompanies, sampleReductionLocations, qualityLotSamplePreparationPulverizers, sampleReductionGridSizes, sampleReductionMethods, qualityLotSamplePreparationDivisionMethods, qualityLotSamplePreparationScreenApertures, clients, traders, samplingLocations, sampleCollectionMethods, qualityLotSamplePreparationMethods: [SimpleConstant]
    public var sampleCollectionPoints: [SampleCollectionPoint]
    public var samplingTransparencies: [SamplingTransparency]
    public var weighingMethods: [WeighingMethod]
    public var maritimePorts: [MaritimePort]

    public enum CodingKeys: String, CodingKey, Codable {
        case smelters, clients, traders
        case maritimePorts = "maritime_ports"
        case dischargeMethods = "discharge_methods"
        case inspectionCompanies = "inspection_companies"
        case samplingCompanies = "sampling_companies"
        case sampleReductionLocations = "sample_reduction_locations"
        case qualityLotSamplePreparationPulverizers = "quality_lot_sample_preparation_pulverizers"
        case sampleReductionGridSizes = "sample_reduction_grid_sizes"
        case sampleReductionMethods = "sample_reduction_methods"
        case weighingMethods = "weighing_methods"
        case sampleCollectionPoints = "sample_collection_points"
        case qualityLotSamplePreparationDivisionMethods = "quality_lot_sample_preparation_division_methods"
        case qualityLotSamplePreparationScreenApertures = "quality_lot_sample_preparation_screen_apertures"
        case samplingTransparencies = "sampling_transparencies"
        case samplingLocations = "sampling_locations"
        case sampleCollectionMethods = "sample_collection_methods"
        case qualityLotSamplePreparationMethods = "quality_lot_sample_preparation_methods"
    }
}
