//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct ConstantWeightCheck: Hashable, Codable {
    public var duration: TimeInterval
    public var numberOfWeighBacks: Int

    public init(duration: TimeInterval, numberOfWeighBacks: Int) {
        self.duration = duration
        self.numberOfWeighBacks = numberOfWeighBacks
    }
}

public extension ConstantWeightCheck {
    var durationInHours: Double {
        get { Measurement<UnitDuration>(value: duration, unit: .seconds).converted(to: .hours).value }
        set { duration = Measurement<UnitDuration>(value: newValue, unit: .hours).converted(to: .seconds).value }
    }
}
