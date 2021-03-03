//
// ConradEntryCore
// Copyright © 2021 Jesse Halley. All rights reserved.
//

import Foundation

public struct AttachmentRole: RawRepresentable, Hashable, ExpressibleByStringLiteral, CustomStringConvertible {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }

    public var description: String {
        NSLocalizedString("attachment-role.\(rawValue)", bundle: .module, comment: "")
    }

    public var isDocument: Bool { rawValue.hasPrefix("doc-") }
}

public extension AttachmentRole {
    static let discharge: AttachmentRole = "discharge"
    static let settlementWeight: AttachmentRole = "settlement-weight"
    static let referenceWeight: AttachmentRole = "reference-weight"
    static let sampleCollection: AttachmentRole = "sample-collection"
    static let sampleReduction: AttachmentRole = "sample-reduction"
    static let moistureDetermination: AttachmentRole = "moisture-determination"
    static let samplePreparation: AttachmentRole = "sample-preparation"

    static let noticeOfReadiness: AttachmentRole = "doc-notice-of-readiness"
    static let vesselPhoto: AttachmentRole = "doc-vessel-photo"
    static let statementOfFacts: AttachmentRole = "doc-statement-of-facts"
    static let moistureCertificate: AttachmentRole = "doc-moisture-certificate"
    static let lotByLotMoistureProfile: AttachmentRole = "doc-lot-by-lot-moisture-profile"
    static let stowagePlan: AttachmentRole = "doc-stowage-plan"

    static var allDocuments: [AttachmentRole] { [.noticeOfReadiness, .vesselPhoto, .statementOfFacts, .moistureCertificate, .lotByLotMoistureProfile, .stowagePlan] }
    static var all: [AttachmentRole] { [.discharge, .settlementWeight, .referenceWeight, .sampleCollection, .sampleReduction, .moistureDetermination, .samplePreparation, .noticeOfReadiness, .vesselPhoto, .statementOfFacts, .moistureCertificate, .lotByLotMoistureProfile, .stowagePlan] }
}

extension AttachmentRole: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(RawValue.self)
        guard let match = Self.all.first(where: { $0.rawValue == rawValue }) else {
            throw DecodingError.valueNotFound(Self.self, .init(codingPath: [], debugDescription: "No AttachmentRole with a raw value of `\(rawValue)` exists."))
        }
        self = match
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
