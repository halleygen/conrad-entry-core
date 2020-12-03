//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

public extension User {
    struct Priviledges: OptionSet, Hashable {
        public typealias RawValue = Int

        public let rawValue: RawValue

        public init(rawValue: RawValue) {
            self.rawValue = rawValue
        }

        public static let editConfigurationConstants = Priviledges(rawValue: 1 << 0)
        public static let readAllShipments = Priviledges(rawValue: 1 << 1)
        public static let writeAllShipments = Priviledges(rawValue: 1 << 2)
        public static let manageUsers = Priviledges(rawValue: 1 << 3)

        public static let none: Priviledges = []
    }
}

extension User.Priviledges: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(RawValue.self)
        self.init(rawValue: rawValue)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
