//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct SimpleConstant: Codable, Hashable, Identifiable {
    public var id: Int
    public var value: String

    public init(id: Int, value: String) {
        self.id = id
        self.value = value
    }
}
