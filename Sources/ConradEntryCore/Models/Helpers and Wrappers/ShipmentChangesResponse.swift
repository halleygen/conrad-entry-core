//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public enum ShipmentChangesResponse<T: Codable & PartialMergable>: Codable {
    case noChanges
    case changes(T)
    case stale

    public init(changes: T) {
        self = changes.isEmpty ? .noChanges : .changes(changes)
    }
}
