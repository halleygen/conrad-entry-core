//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public protocol ETagConvertible: Hashable {
    var eTag: ETag { get }
}

public protocol LosslessETagConvertible: ETagConvertible {
    init?(eTag: ETag)
}

extension Optional: ETagConvertible where Wrapped: ETagConvertible {
    public var eTag: ETag {
        if let self = self {
            return self.eTag
        } else {
            return .catchAll
        }
    }
}

extension UUID: LosslessETagConvertible {
    public var eTag: ETag { .strongValidator(uuidString) }

    public init?(eTag: ETag) {
        self.init(uuidString: eTag.value)
    }
}

extension Date: LosslessETagConvertible {
    public var eTag: ETag { .strongValidator(String(timeIntervalSince1970)) }

    public init?(eTag: ETag) {
        guard let timeIntervalSince1970 = TimeInterval(eTag.value) else { return nil }
        self.init(timeIntervalSince1970: timeIntervalSince1970)
    }
}
