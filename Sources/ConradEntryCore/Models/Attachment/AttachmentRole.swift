//
// ConradEntryCore
// Copyright © 2022 Jesse Halley. All rights reserved.
//

import Foundation

public struct AttachmentRole: Hashable, Sendable {
    public enum Class: String, Sendable {
        case document = "doc", photo
    }

    public enum Section: String, Sendable {
        case details, discharge, settlementWeight, referenceWeight, sampleCollection, sampleReduction, moistureDetermination, samplePreparation
    }

    public enum Subsection: String, Sendable {
        case noticeOfReadiness, vesselPhoto, statementOfFacts, moistureCertificate, lotByLotMoistureProfile, stowagePlan
    }

    public enum CountRequirement: String, Sendable {
        case zeroOrMore = "*"
        case oneOrMore = "1"
    }

    public let `class`: Class
    public let section: Section
    public let subsection: Subsection?
    public let requirement: CountRequirement

    private init(class: Class, section: Section, subsection: Subsection? = nil, requirement: CountRequirement) {
        self.class = `class`
        self.section = section
        self.subsection = subsection
        self.requirement = requirement
    }

    public var localizedDescription: String {
        NSLocalizedString("attachment-role.\(description)", bundle: .module, comment: "")
    }

    static func matching(class: Class, section: Section, subsection: Subsection? = nil, requirement: CountRequirement) -> Self? {
        allCases.first(where: { $0.class == `class` && $0.section == section && $0.subsection == subsection && $0.requirement == requirement })
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
        case 3:
            guard
                let `class` = Class(rawValue: String(splat[0])),
                let section = Section(rawValue: String(splat[1])),
                let requirement = CountRequirement(rawValue: String(splat[2])),
                let role = AttachmentRole.matching(class: `class`, section: section, requirement: requirement)
            else { return nil }
            self = role

        case 4:
            guard
                let `class` = Class(rawValue: String(splat[0])),
                let section = Section(rawValue: String(splat[1])),
                let subsection = Subsection(rawValue: String(splat[2])),
                let requirement = CountRequirement(rawValue: String(splat[3])),
                let role = AttachmentRole.matching(class: `class`, section: section, subsection: subsection, requirement: requirement)
            else { return nil }
            self = role

        default:
            return nil
        }
    }

    public var description: String {
        if let subsection {
            return "\(`class`.rawValue).\(section.rawValue).\(subsection.rawValue).\(requirement.rawValue)"
        } else {
            return "\(`class`.rawValue).\(section.rawValue).\(requirement.rawValue)"
        }
    }
}

extension AttachmentRole: Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        if lhs.class == rhs.class {
            if lhs.section == rhs.section {
                return lhs.localizedDescription < rhs.localizedDescription
            } else {
                return lhs.section.rawValue < lhs.section.rawValue
            }
        } else {
            return lhs.class.rawValue < rhs.class.rawValue
        }
    }
}

public extension AttachmentRole {
    static let dischargePhotos = Self(class: .photo, section: .discharge, requirement: .zeroOrMore)
    static let settlementWeightPhotos = Self(class: .photo, section: .settlementWeight, requirement: .zeroOrMore)
    static let referenceWeightPhotos = Self(class: .photo, section: .referenceWeight, requirement: .zeroOrMore)
    static let sampleCollectionPhotos = Self(class: .photo, section: .sampleCollection, requirement: .zeroOrMore)
    static let sampleReductionPhotos = Self(class: .photo, section: .sampleReduction, requirement: .zeroOrMore)
    static let moistureDeterminationPhotos = Self(class: .photo, section: .moistureDetermination, requirement: .zeroOrMore)
    static let samplePreparationPhotos = Self(class: .photo, section: .samplePreparation, requirement: .zeroOrMore)

    static let noticeOfReadiness = Self(class: .document, section: .details, subsection: .noticeOfReadiness, requirement: .oneOrMore)
    static let vesselPhoto = Self(class: .photo, section: .details, subsection: .vesselPhoto, requirement: .oneOrMore)
    static let statementOfFacts = Self(class: .document, section: .details, subsection: .statementOfFacts, requirement: .oneOrMore)
    static let moistureCertificate = Self(class: .document, section: .moistureDetermination, subsection: .moistureCertificate, requirement: .oneOrMore)
    static let lotByLotMoistureProfile = Self(class: .document, section: .moistureDetermination, subsection: .lotByLotMoistureProfile, requirement: .oneOrMore)
    static let stowagePlan = Self(class: .document, section: .details, subsection: .stowagePlan, requirement: .oneOrMore)
}

extension AttachmentRole: CaseIterable {
    public static var allCases: [AttachmentRole] {
        [.dischargePhotos, .settlementWeightPhotos, .referenceWeightPhotos, .sampleCollectionPhotos, .sampleReductionPhotos, .moistureDeterminationPhotos, .samplePreparationPhotos, .noticeOfReadiness, .vesselPhoto, .statementOfFacts, .moistureCertificate, .lotByLotMoistureProfile, .stowagePlan]
    }
}

// #if !os(Linux)
//
// public extension AttachmentRole {
//    var ref: Reference {
//        Reference
//    }
//
//    init(_ ref: Reference) {
//
//    }
//
//    final class Reference: NSObject, NSCopying, NSSecureCoding {
//        public static var supportsSecureCoding: Bool { true }
//
//        public let `class`: Class
//        public let section: Section
//        public let subsection: Subsection?
//        public let requirement: CountRequirement
//
//        public init(class: Class, section: Section, subsection: Subsection?, requirement: CountRequirement) {
//            self.class = `class`
//            self.section = section
//            self.subsection = subsection
//            self.requirement = requirement
//        }
//
//        public convenience init(_ other: AttachmentRole) {
//            self.init(class: other.class, section: other.section, subsection: other.subsection, requirement: other.requirement)
//        }
//
//        public override func isEqual(_ object: Any?) -> Bool {
//            switch object {
//            case let other as Reference:
//                return `class` == other.class && section == other.section && subsection == other.subsection && requirement == other.requirement
//
//            case let other as AttachmentRole:
//            default:
//                return false
//            }
//        }
//    }
// }
//
// #endif
