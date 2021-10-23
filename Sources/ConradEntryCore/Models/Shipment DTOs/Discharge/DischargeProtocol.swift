//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public protocol DischargeProtocol {
    var berthName: String { get }
    var berthLocation: LocationDTO { get }
    var dischargeGearID: Int { get }
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
    var comments: [String] { get }
}

public extension DischargeProtocol {
    @inlinable var finishTimeForCalculations: Date { finishTimeCleanup }

    @inlinable var interval: DateInterval {
        DateInterval(start: startTime, end: finishTimeCleanup)
    }
}
