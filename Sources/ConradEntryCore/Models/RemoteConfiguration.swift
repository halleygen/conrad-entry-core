//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

public struct RemoteConfiguration: Codable {
    public init(smelter: [String], dischargeMethod: [String], inspectionCompany: [String], samplingCompany: [String], sampleReductionLocation: [String], qualityLotSamplePreparationPulverizer: [String], sampleReductionGridSize: [String], sampleReductionMethod: [String], qualityLotSamplePreparationDivisionMethod: [String], qualityLotSamplePreparationScreenAperture: [String], client: [String], trader: [String], samplingLocation: [String], samplingMethod: [String], qualityLotSamplePreparationMethod: [String], samplingTransparency: [SamplingTransparency], samplingPoint: [SamplingPoint], weighingMethod: [WeighingMethod], maritimePort: [MaritimePort]) {
        self.smelter = smelter
        self.dischargeMethod = dischargeMethod
        self.inspectionCompany = inspectionCompany
        self.samplingCompany = samplingCompany
        self.sampleReductionLocation = sampleReductionLocation
        self.qualityLotSamplePreparationPulverizer = qualityLotSamplePreparationPulverizer
        self.sampleReductionGridSize = sampleReductionGridSize
        self.sampleReductionMethod = sampleReductionMethod
        self.samplingPoint = samplingPoint
        self.qualityLotSamplePreparationDivisionMethod = qualityLotSamplePreparationDivisionMethod
        self.qualityLotSamplePreparationScreenAperture = qualityLotSamplePreparationScreenAperture
        self.client = client
        self.samplingTransparency = samplingTransparency
        self.trader = trader
        self.samplingLocation = samplingLocation
        self.samplingMethod = samplingMethod
        self.qualityLotSamplePreparationMethod = qualityLotSamplePreparationMethod
        self.weighingMethod = weighingMethod
        self.maritimePort = maritimePort
    }
    
    public init() {
        self.smelter = []
        self.dischargeMethod = []
        self.inspectionCompany = []
        self.samplingCompany = []
        self.sampleReductionLocation = []
        self.qualityLotSamplePreparationPulverizer = []
        self.sampleReductionGridSize = []
        self.sampleReductionMethod = []
        self.samplingPoint = []
        self.qualityLotSamplePreparationDivisionMethod = []
        self.qualityLotSamplePreparationScreenAperture = []
        self.client = []
        self.samplingTransparency = []
        self.trader = []
        self.samplingLocation = []
        self.samplingMethod = []
        self.qualityLotSamplePreparationMethod = []
        self.weighingMethod = []
        self.maritimePort = []
    }

    public var smelter, dischargeMethod, inspectionCompany, samplingCompany, sampleReductionLocation, qualityLotSamplePreparationPulverizer, sampleReductionGridSize, sampleReductionMethod, qualityLotSamplePreparationDivisionMethod, qualityLotSamplePreparationScreenAperture, client, trader, samplingLocation, samplingMethod, qualityLotSamplePreparationMethod: [String]
    public var samplingPoint: [SamplingPoint]
    public var samplingTransparency: [SamplingTransparency]
    public var weighingMethod: [WeighingMethod]
    public var maritimePort: [MaritimePort]

    public enum CodingKeys: String, CodingKey {
        case smelter, client, trader
        case maritimePort = "maritime_port"
        case dischargeMethod = "discharge_method"
        case inspectionCompany = "inspection_company"
        case samplingCompany = "sampling_company"
        case sampleReductionLocation = "sample_reduction_location"
        case qualityLotSamplePreparationPulverizer = "quality_lot_sample_preparation_pulverizer"
        case sampleReductionGridSize = "sample_reduction_grid_size"
        case sampleReductionMethod = "sample_reduction_method"
        case weighingMethod = "weighing_method"
        case samplingPoint = "sampling_point"
        case qualityLotSamplePreparationDivisionMethod = "quality_lot_sample_preparation_division_method"
        case qualityLotSamplePreparationScreenAperture = "quality_lot_sample_preparation_screen_aperture"
        case samplingTransparency = "sampling_transparency"
        case samplingLocation = "sampling_location"
        case samplingMethod = "sampling_method"
        case qualityLotSamplePreparationMethod = "quality_lot_sample_preparation_method"
    }
}
