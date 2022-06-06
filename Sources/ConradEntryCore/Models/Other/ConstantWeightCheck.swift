//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct ConstantWeightCheck: Hashable, Codable {
    public var duration: TimeInterval
    public var numberOfWeighbacks: Int

    public init(duration: TimeInterval, numberOfWeighbacks: Int) {
        self.duration = duration
        self.numberOfWeighbacks = numberOfWeighbacks
    }
}
