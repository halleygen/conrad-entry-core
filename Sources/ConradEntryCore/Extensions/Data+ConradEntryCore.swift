//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public extension Data {
    /// Returns a hexadecimal encoded string.
    ///
    /// - Returns: The hexadecimal encoded string.
    func hexadecimalEncodedString() -> String {
        let utf8Digits = ContiguousArray("0123456789abcdef".utf8)
        return String(unsafeUninitializedCapacity: 2 * count) { ptr -> Int in
            var p = ptr.baseAddress!
            for byte in self {
                p[0] = utf8Digits[Int(byte / 16)]
                p[1] = utf8Digits[Int(byte % 16)]
                p += 2
            }
            return 2 * count
        }
    }
}
