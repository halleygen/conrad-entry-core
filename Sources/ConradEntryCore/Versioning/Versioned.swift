//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public protocol Versioned {
    associatedtype Version: EntityTagConvertible
    var version: Version { get }
}
