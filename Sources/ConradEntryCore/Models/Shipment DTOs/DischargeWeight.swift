//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public extension DischargeWeightProperties {
    @inlinable var isSettlementWeight: Bool { kind == .settlement }
    @inlinable var isReferenceWeight: Bool { kind == .reference }
}

public extension DischargeWeightPartialProperties {
    @inlinable var isSettlementWeight: Bool { kind == .settlement }
    @inlinable var isReferenceWeight: Bool { kind == .reference }
}
