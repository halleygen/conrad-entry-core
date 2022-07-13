//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public enum ShipmentChangesResponse<T: Codable & PartialMergable>: Codable {
    case changes(T)
    case stale
}
