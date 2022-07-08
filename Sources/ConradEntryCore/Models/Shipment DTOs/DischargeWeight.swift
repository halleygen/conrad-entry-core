//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public extension DischargeWeightDTO {
    @inlinable var isSettlementWeight: Bool { kind == .settlement }
    @inlinable var isReferenceWeight: Bool { kind == .reference }
}

public extension DischargeWeightCreationRequest {
    @inlinable var isSettlementWeight: Bool { kind == .settlement }
    @inlinable var isReferenceWeight: Bool { kind == .reference }
}

public extension DischargeWeightMutationRequest {
    @inlinable var isSettlementWeight: Bool { kind == .settlement }
    @inlinable var isReferenceWeight: Bool { kind == .reference }
}

public extension PartialDischargeWeightDTO {
    @inlinable var isSettlementWeight: Bool { kind == .settlement }
    @inlinable var isReferenceWeight: Bool { kind == .reference }
}
