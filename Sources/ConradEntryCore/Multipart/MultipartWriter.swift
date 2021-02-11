//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

#if os(iOS) || os(macOS)

    import Combine
    import Foundation

    public final class MultipartWriter {
        private let fileManager: FileManager
        private let destination: URL
        private let outputStream: OutputStream
        private lazy var boundary = Multipart.Boundary()
        private let queue: DispatchQueue

        public init?(queue: DispatchQueue, fileManager: FileManager = .default) {
            self.fileManager = fileManager
            self.destination = fileManager.temporaryDirectory.appendingPathComponent("\(UUID()).multipart", isDirectory: false)
            self.queue = queue

            guard let outputStream = OutputStream(url: destination, append: true) else { return nil }
            self.outputStream = outputStream
        }

        public func append(_ part: Multipart.FormData) -> Future<Void, Error> {
            Future { completion in
                self.queue.async {
                    do {
                        if self.outputStream.streamStatus == .notOpen {
                            self.outputStream.open()
                        }

                        try self.appendPart(part, to: self.outputStream)
                        completion(.success(()))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
        }

        public func finalize() -> Future<(URL, Measurement<UnitInformationStorage>), Error> {
            Future { completion in
                self.queue.async {
                    defer { self.outputStream.close() }

                    do {
                        try self.appendBoundary(to: self.outputStream, isClosingBoundary: true)
                        let resources = try self.destination.resourceValues(forKeys: [.fileSizeKey])
                        let fileSizeInBytes = Measurement<UnitInformationStorage>(value: Double(resources.fileSize!), unit: .bytes)
                        completion(.success((self.destination, fileSizeInBytes)))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
        }
    }

    extension OutputStream {
        @discardableResult
        func tryWrite(_ data: Data, maxLength: Int? = nil) throws -> Int {
            try data.withUnsafeBytes { (rawBufferPointer: UnsafeRawBufferPointer) -> Int in
                let bufferPointer = rawBufferPointer.bindMemory(to: UInt8.self)
                let result = self.write(bufferPointer.baseAddress!, maxLength: maxLength ?? data.count)

                switch result {
                case -1: throw streamError!
                default: return result
                }
            }
        }
    }

    private extension MultipartWriter {
        private func appendCRLF(to outputStream: OutputStream) throws {
            try outputStream.tryWrite(Data([.carriageReturn, .newLine]), maxLength: 2)
        }

        private func appendHeader(_ header: Multipart.Header, to outputStream: OutputStream) throws {
            let headerData = Data(header.key.utf8) + Data([.colon, .space]) + Data(header.value.utf8)
            try outputStream.tryWrite(headerData)
            try appendCRLF(to: outputStream)
        }

        private func append(contentsOf inputStream: InputStream, to outputStream: OutputStream) throws {
            inputStream.open()
            defer { inputStream.close() }

            let bufferSize = 512
            let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: bufferSize)
            defer { buffer.deallocate() }

            while inputStream.hasBytesAvailable {
                let bytesRead = inputStream.read(buffer, maxLength: bufferSize)

                switch bytesRead {
                case -1: throw inputStream.streamError!
                case 0: return
                default: break
                }

                let bytesWritten = outputStream.write(buffer, maxLength: bytesRead)
                if bytesWritten == -1 {
                    throw outputStream.streamError!
                }
            }
        }

        func appendBoundary(to outputStream: OutputStream, isClosingBoundary: Bool) throws {
            let doubleHyphen = Data([.hyphen, .hyphen])

            try outputStream.tryWrite(doubleHyphen, maxLength: 2)
            try outputStream.tryWrite(boundary.data, maxLength: 16)

            if isClosingBoundary {
                try outputStream.tryWrite(doubleHyphen, maxLength: 2)
                try appendCRLF(to: outputStream)
            }
        }

        func appendPart(_ formData: Multipart.FormData, to outputStream: OutputStream) throws {
            try appendBoundary(to: outputStream, isClosingBoundary: false)
            try appendCRLF(to: outputStream)
            try appendHeader(formData.contentDispositionHeader, to: outputStream)
            try formData.contentTypeHeader.map { try appendHeader($0, to: outputStream) }
            try appendCRLF(to: outputStream)
            try append(contentsOf: formData.content.stream, to: outputStream)
            try appendCRLF(to: outputStream)
        }
    }

    private extension UInt8 {
        static let hyphen: UInt8 = 0x2D
        static let carriageReturn: UInt8 = 0xD
        static let newLine: UInt8 = 0xA
        static let colon: UInt8 = 0x3A
        static let space: UInt8 = 0x20
    }

#endif
