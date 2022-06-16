//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public protocol SampleReductionProtocol {
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
    var comments: [String] { get }
}

public extension SampleReductionProtocol {
    var wasScreened: Bool { screenApertureMillimetres != nil }
}
