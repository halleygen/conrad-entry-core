//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

public enum NotificationCategory: String, CaseIterable {
    case accountLockStateChanged = "ACCOUNT_LOCK_STATUS_CHANGED"
    case newUserSignup = "NEW_USER_SIGNUP"
}

public struct NewAccountSignupNotificationPayload: Codable {
    public let userID: UUID
    
    public enum CodingKeys: String, CodingKey {
        case userID = "USER_ID"
    }
}

public enum BackgroundNotificationAction {
    public static let signOut = "SIGN_OUT"
}

#if canImport(UserNotifications)
    import UserNotifications

    public enum NotificationAction: String {
        case approveSignup = "APPROVE_SIGNUP_ACTION", denySignup = "DENY_SIGNUP_ACTION"

        public var localizedTitle: String {
            NSLocalizedString("notification-action.\(rawValue)", bundle: .module, comment: "")
        }

        public var unAction: UNNotificationAction {
            switch self {
            case .approveSignup:
                return UNNotificationAction(identifier: rawValue, title: localizedTitle, options: .authenticationRequired)

            case .denySignup:
                return UNNotificationAction(identifier: rawValue, title: localizedTitle, options: [.authenticationRequired, .destructive])
            }
        }
    }

    public extension NotificationCategory {
        static var allCategories: Set<UNNotificationCategory> {
            let categories = allCases.map { category -> UNNotificationCategory in
                UNNotificationCategory(identifier: category.rawValue, actions: category.actions, intentIdentifiers: [], options: [])
            }
            return Set(categories)
        }

        private var actions: [UNNotificationAction] {
            switch self {
            case .accountLockStateChanged:
                return []

            case .newUserSignup:
                return [NotificationAction.approveSignup.unAction, NotificationAction.denySignup.unAction]
            }
        }
    }
#endif
