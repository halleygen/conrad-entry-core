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
