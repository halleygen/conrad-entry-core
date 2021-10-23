//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public protocol ETagConvertible: Hashable {
    var eTagValue: String { get }
}

public protocol LosslessETagConvertible: ETagConvertible {
    init?(eTagValue: String)
}

public extension LosslessStringConvertible where Self: LosslessETagConvertible {
    var eTagValue: String { String(self) }
    init?(eTagValue: String) { self.init(eTagValue) }
}

extension UUID: LosslessETagConvertible {
    public var eTagValue: String { uuidString }

    public init?(eTagValue: String) {
        self.init(uuidString: eTagValue)
    }
}

@available(*, deprecated)
extension Optional: ETagConvertible where Wrapped: ETagConvertible {
    @available(*, deprecated)
    public var eTagValue: String {
        guard let self = self else { return "" }
        return self.eTagValue
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
