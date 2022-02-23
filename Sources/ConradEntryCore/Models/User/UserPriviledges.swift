//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public enum UserPrivilege: Int, CaseIterable, Codable {
    case readAllShipments, writeAllShipments, editConfigurationValues, manageUsers, exportData
}

extension UserPrivilege: Identifiable {
    public var id: Self { self }
}

extension UserPrivilege: CustomStringConvertible {
    public var description: String {
        switch self {
        case .readAllShipments: return NSLocalizedString("user.privileges.read-all-shipments", bundle: .module, comment: "")
        case .writeAllShipments: return NSLocalizedString("user.privileges.write-all-shipments", bundle: .module, comment: "")
        case .editConfigurationValues: return NSLocalizedString("user.privileges.edit-configuration-values", bundle: .module, comment: "")
        case .manageUsers: return NSLocalizedString("user.privileges.manage-users", bundle: .module, comment: "")
        case .exportData: return NSLocalizedString("user.privileges.export-data", bundle: .module, comment: "")
        }
    }
}

public extension Set where Element == UserPrivilege {
    static var all: Set<Element> { Set(Element.allCases) }
    static var none: Set<Element> { Set() }
}
