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
        NSCalendar.Identifier(self).rawValue
    }
}

public extension NSCalendar.Identifier {
    init(_ identifier: Calendar.Identifier) {
        switch identifier {
        case .gregorian: self = .gregorian
        case .buddhist: self = .buddhist
        case .chinese: self = .chinese
        case .coptic: self = .coptic
        case .ethiopicAmeteMihret: self = .ethiopicAmeteMihret
        case .ethiopicAmeteAlem: self = .ethiopicAmeteAlem
        case .hebrew: self = .hebrew
        case .iso8601: self = .ISO8601
        case .indian: self = .indian
        case .islamic: self = .islamic
        case .islamicCivil: self = .islamicCivil
        case .japanese: self = .japanese
        case .persian: self = .persian
        case .republicOfChina: self = .republicOfChina
        case .islamicTabular: self = .islamicTabular
        case .islamicUmmAlQura: self = .islamicUmmAlQura
        @unknown default: fatalError("Unknown calendar identifier: \(identifier)")
        }
    }
}
