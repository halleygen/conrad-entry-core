//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public extension SampleReductionProperties {
    var wasScreened: Bool { screenApertureMillimetres != nil }
}

public extension SampleReductionPartialProperties {
    var wasScreened: Bool? {
        guard let screenApertureMillimetres else { return nil }
        return screenApertureMillimetres != nil
    }
}
