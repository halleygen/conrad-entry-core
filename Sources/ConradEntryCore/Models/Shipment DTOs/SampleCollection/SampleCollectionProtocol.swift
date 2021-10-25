//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public protocol SampleCollectionProtocol {
    var samplingCompanyID: Int { get }
    var siteID: Int { get }
    var locationDTO: LocationDTO { get }
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
    var comments: [String] { get }
}
