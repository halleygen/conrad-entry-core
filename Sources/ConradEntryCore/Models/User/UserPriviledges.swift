//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public extension User {
    @objc
    enum Privilege: Int, CaseIterable, Codable {
        case readAllShipments, writeAllShipments, editConfigurationValues, manageUsers
    }
}

extension User.Privilege: Identifiable {
    public var id: User.Privilege { self }
}

extension User.Privilege: CustomStringConvertible {
    public var description: String {
        switch self {
        case .readAllShipments: return NSLocalizedString("user.privileges.read-all-shipments", bundle: .module, comment: "")
        case .writeAllShipments: return NSLocalizedString("user.privileges.write-all-shipments", bundle: .module, comment: "")
        case .editConfigurationValues: return NSLocalizedString("user.privileges.edit-configuration-values", bundle: .module, comment: "")
        case .manageUsers: return NSLocalizedString("user.privileges.manage-users", bundle: .module, comment: "")
        }
    }
}
