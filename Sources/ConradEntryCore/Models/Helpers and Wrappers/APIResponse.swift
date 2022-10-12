//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public protocol APIResponseItem: Identifiable, Versioned, Codable where ID: Codable, Version: Codable {}

protocol APIResponse: Identifiable, Versioned {
    associatedtype Item: APIResponseItem where Item.ID == ID, Item.Version == Version
}
