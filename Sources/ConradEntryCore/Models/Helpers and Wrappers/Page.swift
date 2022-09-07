//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

// Copied from Vapor

#if os(iOS) || os(macOS)

    /// A single section of a larger, traversable result set.
    public struct Page<T> {
        /// The page's items. Usually models.
        public let items: [T]

        /// Metadata containing information about current page, items per page, and total items.
        public let metadata: PageMetadata

        /// Creates a new `Page`.
        public init(items: [T], metadata: PageMetadata) {
            self.items = items
            self.metadata = metadata
        }

        /// Maps a page's items to a different type using the supplied closure.
        public func map<U>(_ transform: (T) throws -> (U)) rethrows -> Page<U> {
            try .init(
                items: items.map(transform),
                metadata: metadata
            )
        }
    }

    extension Page: Encodable where T: Encodable {}
    extension Page: Decodable where T: Decodable {}

    /// Metadata for a given `Page`.
    public struct PageMetadata: Codable, Sendable {
        /// Current page number. Starts at `1`.
        public let page: Int

        /// Max items per page.
        public let per: Int

        /// Total number of items available.
        public let total: Int

        /// Computed total number of pages with `1` being the minimum.
        public var pageCount: Int {
            let count = Int((Double(total) / Double(per)).rounded(.up))
            return count < 1 ? 1 : count
        }

        /// Creates a new `PageMetadata` instance.
        ///
        /// - Parameters:
        /// .  - page: Current page number.
        /// .  - per: Max items per page.
        /// .  - total: Total number of items available.
        public init(page: Int, per: Int, total: Int) {
            self.page = page
            self.per = per
            self.total = total
        }
    }

    extension Page: Sendable where T: Sendable {}

#endif
