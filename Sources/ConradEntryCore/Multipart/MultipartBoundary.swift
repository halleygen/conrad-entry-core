//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

#if os(iOS) || os(macOS)

    import Foundation

    public extension Multipart {
        struct Boundary: CustomStringConvertible {
            let data: Data

            public init() {
                self.data = Data(UUID().uuidString.utf8)
            }

            public init(_ rawValue: String) {
                self.data = Data(rawValue.utf8)
            }

            public var description: String { String(data: data, encoding: .utf8)! }
        }
    }

#endif
