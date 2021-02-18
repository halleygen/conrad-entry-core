//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public struct Tallymen: Hashable, Codable {
    /// The number of tallymen.
    public var count: Int

    /// The location of the tallymen.
    public var location: String

    public init(count: Int, location: String) {
        self.count = count
        self.location = location
    }
}
