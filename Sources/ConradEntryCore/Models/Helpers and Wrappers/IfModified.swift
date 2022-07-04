//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public enum IfModified<T> {
    case modified(T)
    case notModified
}

extension IfModified: Equatable where T: Equatable {}
extension IfModified: Hashable where T: Hashable {}
