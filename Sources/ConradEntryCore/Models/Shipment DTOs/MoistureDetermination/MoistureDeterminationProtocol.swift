//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public protocol MoistureDeterminationProtocol {
    var moistureDeterminationCompanyID: Int { get }
    var siteID: Int { get }
    var locationDTO: LocationDTO { get }
    var lotSampleTrayWeightKilograms: Double { get }
    var ovenOnTime: Date { get }
    var ovenOffTime: Date { get }
    var ovenTemperatureCelsius: Int { get }
    var checkedForConstantWeight: Bool { get }
    var constantWeightDuration: TimeInterval? { get }
    var numberOfWeighBacks: Int? { get }
    var resultsWaitTimeDays: Int { get }
    var transparencyID: Int { get }
    var comments: [String] { get }
}

public extension MoistureDeterminationProtocol {
    @inlinable var durationInOven: TimeInterval { ovenOffTime.timeIntervalSince(ovenOnTime) }
}
