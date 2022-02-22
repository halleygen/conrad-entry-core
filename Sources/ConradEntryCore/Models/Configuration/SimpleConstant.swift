//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct SimpleConstant: ConfigurationConstant {
    public var id: Int
    public var value: String
    public var representsOtherValue: Bool

    public init(id: Int, value: String, representsOtherValue: Bool) {
        self.id = id
        self.value = value
        self.representsOtherValue = representsOtherValue
    }
}

public extension SimpleConstant {
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id, value, representsOtherValue
    }
}
