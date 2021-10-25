//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public protocol SamplePreparationProtocol {
    var preparationCompanyID: Int { get }
    var siteID: Int { get }
    var locationDTO: LocationDTO { get }
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
    var comments: [String] { get }
}
