//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public extension SampleReductionDTO {
    var wasScreened: Bool { screenApertureMillimetres != nil }
}

public extension SampleReductionCreationRequest {
    var wasScreened: Bool { screenApertureMillimetres != nil }
}
