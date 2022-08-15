//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public enum ShipmentChangesResponse<T: Codable>: Codable {
    case noChanges
    case changes(T)
    case stale
}
