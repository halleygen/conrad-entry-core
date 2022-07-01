//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public protocol VersionedResource {
    associatedtype Version: ETagConvertible
    var version: Version { get }
}
