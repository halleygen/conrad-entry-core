//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public protocol VersionedResource {
    associatedtype Version: ETagConvertible
    var version: Version { get }
}

public extension VersionedResource {
    func versionMatches(_ otherVersion: Version) -> Bool {
        versionMatches(otherVersion.eTagValue)
    }

    func versionMatches<V: ETagConvertible>(_ otherVersion: V) -> Bool {
        versionMatches(otherVersion.eTagValue)
    }

    func versionMatches(_ eTagHeader: String) -> Bool {
        switch eTagHeader {
        case "*": return true
        case version.eTagValue: return true
        default: return false
        }
    }
}
