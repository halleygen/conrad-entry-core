//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

public enum NotificationCategory: String, CaseIterable {
    case accountLockStateChanged = "ACCOUNT_LOCK_STATUS_CHANGED"
    case newUserSignup = "NEW_USER_SIGNUP"
}

public enum NotificationUserInfoKey {
    public static let userID = "USER_ID"
}

#if canImport(UserNotifications)
    import UserNotifications

    public enum NotificationAction: String {
        case approve = "APPROVE_ACTION", deny = "DENY_ACTION"

        public var localizedTitle: String {
            NSLocalizedString("notification-action.\(rawValue)", bundle: .module, comment: "")
        }

        public var unAction: UNNotificationAction {
            switch self {
            case .approve:
                return UNNotificationAction(identifier: rawValue, title: localizedTitle, options: .authenticationRequired)

            case .deny:
                return UNNotificationAction(identifier: rawValue, title: localizedTitle, options: [.authenticationRequired, .destructive])
            }
        }
    }

    public extension NotificationCategory {
        static var allCategories: [UNNotificationCategory] {
            allCases.map { category -> UNNotificationCategory in
                UNNotificationCategory(identifier: category.rawValue, actions: category.actions, intentIdentifiers: [], options: category.options)
            }
        }

        private var options: UNNotificationCategoryOptions {
            #if os(iOS)
                return [.allowAnnouncement]
            #else
                return []
            #endif
        }

        private var actions: [UNNotificationAction] {
            switch self {
            case .accountLockStateChanged:
                return []

            case .newUserSignup:
                return [NotificationAction.approve.unAction, NotificationAction.deny.unAction]
            }
        }
    }
#endif
