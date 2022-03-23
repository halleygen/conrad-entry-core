//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct AttachmentRole: Hashable {
    public enum Class: String, Codable {
        case document = "doc", photo
    }

    public enum Section: String, Codable {
        case details, discharge, settlementWeight, referenceWeight, sampleCollection, sampleReduction, moistureDetermination, samplePreparation
    }

    public enum Subsection: String, Codable {
        case noticeOfReadiness, vesselPhoto, statementOfFacts, moistureCertificate, lotByLotMoistureProfile, stowagePlan
    }

    public let `class`: Class
    public let section: Section
    public let subsection: Subsection?

    private init(class: Class, section: Section, subsection: Subsection? = nil) {
        self.class = `class`
        self.section = section
        self.subsection = subsection
    }

    static func matching(class: Class, section: Section, subsection: Subsection? = nil) -> Self? {
        allCases.first(where: { $0.class == `class` && $0.section == section && $0.subsection == subsection })
    }
}

extension AttachmentRole: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let raw = try container.decode(String.self)
        guard let decoded = Self(raw) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Could not create \(Self.self) from decoded string: \"\(raw)\".")
        }
        self = decoded
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(String(self))
    }
}

extension AttachmentRole: LosslessStringConvertible {
    public init?(_ description: String) {
        let splat = description.split(separator: ".")
        switch splat.count {
        case 2:
            guard
                let `class` = Class(rawValue: String(splat[0])),
                let section = Section(rawValue: String(splat[1])),
                let role = AttachmentRole.matching(class: `class`, section: section)
            else { return nil }
            self = role

        case 3:
            guard
                let `class` = Class(rawValue: String(splat[0])),
                let section = Section(rawValue: String(splat[1])),
                let subsection = Subsection(rawValue: String(splat[2])),
                let role = AttachmentRole.matching(class: `class`, section: section, subsection: subsection)
            else { return nil }
            self = role

        default:
            return nil
        }
    }

    public var description: String {
        if let subsection = subsection {
            return "\(`class`.rawValue).\(section.rawValue).\(subsection.rawValue)"
        } else {
            return "\(`class`.rawValue).\(section.rawValue)"
        }
    }
}

public extension AttachmentRole {
    static let dischargePhotos = Self(class: .photo, section: .discharge)
    static let settlementWeightPhotos = Self(class: .photo, section: .settlementWeight)
    static let referenceWeightPhotos = Self(class: .photo, section: .referenceWeight)
    static let sampleCollectionPhotos = Self(class: .photo, section: .sampleCollection)
    static let sampleReductionPhotos = Self(class: .photo, section: .sampleReduction)
    static let moistureDeterminationPhotos = Self(class: .photo, section: .moistureDetermination)
    static let samplePreparationPhotos = Self(class: .photo, section: .samplePreparation)

    static let noticeOfReadiness = Self(class: .document, section: .details, subsection: .noticeOfReadiness)
    static let vesselPhoto = Self(class: .photo, section: .details, subsection: .vesselPhoto)
    static let statementOfFacts = Self(class: .document, section: .details, subsection: .statementOfFacts)
    static let moistureCertificate = Self(class: .document, section: .moistureDetermination, subsection: .moistureCertificate)
    static let lotByLotMoistureProfile = Self(class: .document, section: .moistureDetermination, subsection: .lotByLotMoistureProfile)
    static let stowagePlan = Self(class: .document, section: .details, subsection: .stowagePlan)
}

extension AttachmentRole: CaseIterable {
    public static var allCases: [AttachmentRole] {
        [.dischargePhotos, .settlementWeightPhotos, .referenceWeightPhotos, .sampleCollectionPhotos, .sampleReductionPhotos, .moistureDeterminationPhotos, .samplePreparationPhotos, .noticeOfReadiness, .vesselPhoto, .statementOfFacts, .moistureCertificate, .lotByLotMoistureProfile, .stowagePlan]
    }
}
