//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

#if canImport(UIKit) || canImport(IOKit)

    import Foundation

    #if canImport(UIKit)
        import UIKit
    #elseif canImport(IOKit)
        import IOKit
    #endif

    public extension Device {
        static func current() -> Device {
            #if canImport(UIKit)
                let uiDevice = UIDevice.current

                #if targetEnvironment(macCatalyst)
                    let model = "Desktop Computer"
                    let systemName = "Mac Catalyst"
                #else
                    let model = uiDevice.model
                    let systemName = uiDevice.systemName
                #endif

                return Device(
                    id: uiDevice.identifierForVendor!,
                    name: uiDevice.name,
                    model: model,
                    systemName: systemName,
                    systemVersion: uiDevice.systemVersion,
                    createdAt: nil
                )
            #elseif os(macOS)
                let service = IOServiceGetMatchingService(kIOMainPortDefault, IOServiceMatching("IOPlatformExpertDevice"))
                defer { IOObjectRelease(service) }

                return Device(
                    id: currentDeviceIdentifierForVendor(service: service),
                    name: Host.current().localizedName!,
                    model: "Desktop Computer",
                    systemName: "macOS",
                    systemVersion: ProcessInfo.processInfo.operatingSystemVersionString,
                    createdAt: nil
                )
            #endif
        }

        #if os(macOS)
            static func currentDeviceIdentifierForVendor(service: io_service_t? = nil) -> UUID {
                let uuidString: String
                if let service = service {
                    uuidString = IORegistryEntryCreateCFProperty(service, kIOPlatformUUIDKey as CFString, nil, 0).takeRetainedValue() as! String
                } else {
                    let service = IOServiceGetMatchingService(kIOMainPortDefault, IOServiceMatching("IOPlatformExpertDevice"))
                    defer { IOObjectRelease(service) }
                    uuidString = IORegistryEntryCreateCFProperty(service, kIOPlatformUUIDKey as CFString, nil, 0).takeRetainedValue() as! String
                }
                return UUID(uuidString: uuidString)!
            }

            private static func currentDeviceModel(service: io_service_t? = nil) -> String? {
                let modelData: Data
                if let service = service {
                    modelData = IORegistryEntryCreateCFProperty(service, "model" as CFString, nil, 0).takeRetainedValue() as! Data
                } else {
                    let service = IOServiceGetMatchingService(kIOMainPortDefault, IOServiceMatching("IOPlatformExpertDevice"))
                    defer { IOObjectRelease(service) }
                    modelData = IORegistryEntryCreateCFProperty(service, "model" as CFString, nil, 0).takeRetainedValue() as! Data
                }

                return modelData.withUnsafeBytes { buffer -> String? in
                    guard let pointer = buffer.baseAddress?.assumingMemoryBound(to: UInt8.self) else { return nil }
                    return String(cString: pointer)
                }
            }
        #endif
    }
#endif
