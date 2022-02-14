//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public protocol ConfigurationConstant: Identifiable, Hashable, DictionaryCodable where ID == Int {
    var value: String { get }
    var representsOtherValue: Bool { get }
}
