//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public protocol BillOfLadingProtocol {
    var loadPortID: Int { get }
    var vesselHolds: Set<Int> { get }
    var weighingMethodID: Int { get }
    var wetMetricTonnes: Double { get }
    var moisturePercentage: Double { get }
    var dryMetricTonnes: Double { get }
    var comments: [String] { get }
}
