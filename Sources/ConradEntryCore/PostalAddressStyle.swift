//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

#if canImport(Contacts)

    import Contacts

    public extension FormatStyle where Self == CNPostalAddress._FormatStyle {
        static var mailingAddress: Self { Self() }
    }

    public extension CNPostalAddress {
        struct _FormatStyle: FormatStyle {
            public typealias FormatInput = CNPostalAddress
            public typealias FormatOutput = String

            public var style: CNPostalAddressFormatterStyle = .mailingAddress

            public func format(_ value: FormatInput) -> FormatOutput {
                CNPostalAddressFormatter.string(from: value, style: style)
            }
        }

        func formatted(style: CNPostalAddressFormatterStyle = .mailingAddress) -> String { _FormatStyle(style: style).format(self) }
    }

    extension CNPostalAddressFormatterStyle: Codable {}

#endif
