//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public extension MoistureDeterminationDTO {
    @inlinable var durationInOven: TimeInterval { ovenOffTime.timeIntervalSince(ovenOnTime) }
}

public extension MoistureDeterminationCreationRequest {
    @inlinable var durationInOven: TimeInterval { ovenOffTime.timeIntervalSince(ovenOnTime) }
}
