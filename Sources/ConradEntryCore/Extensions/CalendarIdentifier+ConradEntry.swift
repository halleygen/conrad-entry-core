//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public extension Calendar.Identifier {
    init?(_ identifier: NSCalendar.Identifier) {
        switch identifier {
        case .gregorian: self = .gregorian
        case .ISO8601: self = .iso8601
        case .buddhist: self = .buddhist
        case .chinese: self = .chinese
        case .coptic: self = .coptic
        case .ethiopicAmeteAlem: self = .ethiopicAmeteAlem
        case .ethiopicAmeteMihret: self = .ethiopicAmeteMihret
        case .hebrew: self = .hebrew
        case .indian: self = .indian
        case .islamic: self = .islamic
        case .islamicCivil: self = .islamicCivil
        case .islamicTabular: self = .islamicTabular
        case .islamicUmmAlQura: self = .islamicUmmAlQura
        case .japanese: self = .japanese
        case .persian: self = .persian
        case .republicOfChina: self = .republicOfChina
        default: return nil
        }
    }
}

extension Calendar.Identifier: LosslessStringConvertible {
    public init?(_ description: String) {
        self.init(NSCalendar.Identifier(rawValue: description))
    }

    public var description: String {
        switch self {
        case .gregorian: return NSCalendar.Identifier.gregorian.rawValue
        case .iso8601: return NSCalendar.Identifier.ISO8601.rawValue
        case .buddhist: return NSCalendar.Identifier.buddhist.rawValue
        case .chinese: return NSCalendar.Identifier.chinese.rawValue
        case .coptic: return NSCalendar.Identifier.coptic.rawValue
        case .ethiopicAmeteAlem: return NSCalendar.Identifier.ethiopicAmeteAlem.rawValue
        case .ethiopicAmeteMihret: return NSCalendar.Identifier.ethiopicAmeteMihret.rawValue
        case .hebrew: return NSCalendar.Identifier.hebrew.rawValue
        case .indian: return NSCalendar.Identifier.indian.rawValue
        case .islamic: return NSCalendar.Identifier.islamic.rawValue
        case .islamicCivil: return NSCalendar.Identifier.islamicCivil.rawValue
        case .islamicTabular: return NSCalendar.Identifier.islamicTabular.rawValue
        case .islamicUmmAlQura: return NSCalendar.Identifier.islamicUmmAlQura.rawValue
        case .japanese: return NSCalendar.Identifier.japanese.rawValue
        case .persian: return NSCalendar.Identifier.persian.rawValue
        case .republicOfChina: return NSCalendar.Identifier.republicOfChina.rawValue
        @unknown default: fatalError("Unknown calendar identifier: \(self)")
        }
    }
}

extension Calendar.Identifier: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        guard let id = Self(rawValue) else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Calendar identifier '\(rawValue)' is not recognised.", underlyingError: nil))
        }
        self = id
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }
}
