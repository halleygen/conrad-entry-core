//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public extension DischargeProperties {
    @inlinable var finishTimeForCalculations: Date { finishTimeCleanup }

    @inlinable var interval: DateInterval {
        DateInterval(start: startTime, end: finishTimeCleanup)
    }
}

public extension DischargePartialProperties {
    @inlinable var finishTimeForCalculations: Date? { finishTimeCleanup }

    @inlinable var interval: DateInterval? {
        guard let startTime = startTime, let finishTimeCleanup = finishTimeCleanup else { return nil }
        return DateInterval(start: startTime, end: finishTimeCleanup)
    }
}
