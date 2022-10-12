//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public protocol EntityTagConvertible: Hashable {
    var entityTag: EntityTag? { get }
}

public protocol LosslessEntityTagConvertible: EntityTagConvertible {
    init?(entityTag: EntityTag)
}

extension Optional: EntityTagConvertible where Wrapped: EntityTagConvertible {
    public var entityTag: EntityTag? { self?.entityTag }
}

extension UUID: LosslessEntityTagConvertible {
    public var entityTag: EntityTag? { .strongValidator(uuidString) }

    public init?(entityTag: EntityTag) {
        self.init(uuidString: entityTag.value)
    }
}

extension Date: LosslessEntityTagConvertible {
    public var entityTag: EntityTag? { .strongValidator(String(timeIntervalSince1970)) }

    public init?(entityTag: EntityTag) {
        guard let timeIntervalSince1970 = TimeInterval(entityTag.value) else { return nil }
        self.init(timeIntervalSince1970: timeIntervalSince1970)
    }
}
