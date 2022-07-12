//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public extension MoistureDeterminationProperties {
    @inlinable var durationInOven: TimeInterval { ovenOffTime.timeIntervalSince(ovenOnTime) }
}

public extension MoistureDeterminationPartialProperties {
    @inlinable var durationInOven: TimeInterval? {
        guard let ovenOffTime = ovenOffTime, let ovenOnTime = ovenOnTime else { return nil }
        return ovenOffTime.timeIntervalSince(ovenOnTime)
    }
}
