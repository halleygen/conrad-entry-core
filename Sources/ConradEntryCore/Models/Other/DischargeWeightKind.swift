//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public enum DischargeWeightKind: String, CustomStringConvertible, Codable, CaseIterable {
    case settlement, reference

    public var description: String {
        NSLocalizedString("discharge-weight.kind.\(rawValue)", bundle: .module, comment: "")
    }
}
