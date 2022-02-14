//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public protocol ETagConvertible: Hashable {
    var eTagValue: String { get }
}

public protocol LosslessETagConvertible: ETagConvertible {
    init?(eTagValue: String)
}

extension Optional: ETagConvertible where Wrapped: ETagConvertible {
    public var eTagValue: String {
        if let self = self {
            return self.eTagValue
        } else {
            return "*"
        }
    }
}

extension UUID: LosslessETagConvertible {
    public var eTagValue: String { uuidString }

    public init?(eTagValue: String) {
        self.init(uuidString: eTagValue)
    }
}

extension Date: LosslessETagConvertible {
    public var eTagValue: String {
        String(timeIntervalSince1970)
    }

    public init?(eTagValue: String) {
        guard let timeIntervalSince1970 = TimeInterval(eTagValue) else { return nil }
        self.init(timeIntervalSince1970: timeIntervalSince1970)
    }
}
