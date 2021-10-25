//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public protocol SampleReductionProtocol {
    var samplingCompanyID: Int { get }
    var locationDTO: LocationDTO { get }
    var siteID: Int { get }
    var laboratoryID: Int? { get }
    var pointID: Int { get }
    var startTime: Date { get }
    var finishTime: Date { get }
    var wasScreened: Bool { get }
    var screenApertureMillimetres: Double? { get }
    var wasConedAndQuartered: Bool { get }
    var methodID: Int { get }
    var gridSizeID: Int? { get }
    var comments: [String] { get }
}
