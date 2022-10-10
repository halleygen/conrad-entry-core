//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

#if os(iOS) || os(macOS)

    import Foundation
    import UniformTypeIdentifiers

    public enum Multipart {
        public struct FormData {
            public let name: String
            public let file: (name: String, contentType: UTType)?
            public let content: Content

            public init(name: String, file: (name: String, contentType: UTType)?, content: Multipart.Content) {
                self.name = name
                self.file = file
                self.content = content
            }

            public var contentDispositionHeader: Header { .contentDisposition(name: name, file: file) }
            public var contentTypeHeader: Header? { (file?.contentType).map(Header.contentType(_:)) }
        }

        public enum Content {
            case data(Data)
            case file(URL)

            public var stream: InputStream {
                switch self {
                case let .data(data): return InputStream(data: data)
                case let .file(url): return InputStream(url: url)!
                }
            }
        }
    }

    public extension Multipart {
        struct Header: Hashable {
            public let key: String
            public let value: String

            public static func contentDisposition(name: String, file: (name: String, contentType: UTType)? = nil) -> Header {
                let value: String
                if let file {
                    if let filenameExtension = file.contentType.preferredFilenameExtension {
                        value = "form-data; name=\"\(name)\"; filename=\"\(file.name).\(filenameExtension)\""
                    } else {
                        value = "form-data; name=\"\(name)\"; filename=\"\(file.name)\""
                    }
                } else {
                    value = "form-data; name=\"\(name)\";"
                }

                return Header(key: "Content-Disposition", value: value)
            }

            public static func contentType(_ contentType: UTType) -> Header {
                Header(key: "Content-Type", value: contentType.preferredMIMEType ?? "text/plain")
            }
        }
    }

#endif
