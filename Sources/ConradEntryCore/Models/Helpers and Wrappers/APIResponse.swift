//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public protocol APIResponseItem: Identifiable, VersionedResource, Codable where ID: Codable, Version: Codable {}

protocol APIResponse: Identifiable, VersionedResource {
    associatedtype Item: APIResponseItem where Item.ID == ID, Item.Version == Version
}
