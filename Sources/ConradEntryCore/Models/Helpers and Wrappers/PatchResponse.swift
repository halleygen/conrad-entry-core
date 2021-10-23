//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public enum PatchResponse<Item: Codable>: Codable {
    case success(lastModified: Date)
    case conflict(Item)
}

extension PatchResponse: Equatable where Item: Equatable {}
extension PatchResponse: Hashable where Item: Hashable {}
