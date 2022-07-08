//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public extension DischargeDTO {
    @inlinable var finishTimeForCalculations: Date { finishTimeCleanup }

    @inlinable var interval: DateInterval {
        DateInterval(start: startTime, end: finishTimeCleanup)
    }
}

public extension DischargeCreationRequest {
    @inlinable var finishTimeForCalculations: Date { finishTimeCleanup }

    @inlinable var interval: DateInterval {
        DateInterval(start: startTime, end: finishTimeCleanup)
    }
}
