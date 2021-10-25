//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public enum PatchResponse<Item: VersionedResource> {
    case success(version: Item.Version)
    case conflict(item: Item)
}

extension PatchResponse: Equatable where Item: Equatable, Item.Version: Equatable {}
extension PatchResponse: Hashable where Item: Hashable, Item.Version: Hashable {}
extension PatchResponse: Encodable where Item: Encodable, Item.Version: Encodable {}
extension PatchResponse: Decodable where Item: Decodable, Item.Version: Decodable {}
