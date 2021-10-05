//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public enum CreateResponse<Item: Codable & Identifiable>: Codable where Item.ID: Codable {
    case success(id: Item.ID, updatedAt: Date)
    case alreadyExists(existing: Item)
}

extension CreateResponse: Equatable where Item: Equatable {}
extension CreateResponse: Hashable where Item: Hashable {}
