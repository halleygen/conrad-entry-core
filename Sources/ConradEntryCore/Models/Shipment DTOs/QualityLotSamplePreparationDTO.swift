//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct QualityLotSamplePreparationDTO: Codable {
    public let id: UUID?
    public let preparationCompanyID: UUID
    public let methodID: UUID
    public let wasScreened: Bool
    public let screenApertureID: UUID?
    public let oversizePulverizedSeparately: Bool?
    public let pulverizerID: UUID
    public let pulverizingDurationSeconds: TimeInterval
    public let divisionMethodID: UUID
    public let numberOfSets: Int
    public let transparencyID: UUID
    public let comments: String

    public init(id: UUID?, preparationCompanyID: UUID, methodID: UUID, wasScreened: Bool, screenApertureID: UUID?, oversizePulverizedSeparately: Bool?, pulverizerID: UUID, pulverizingDurationSeconds: TimeInterval, divisionMethodID: UUID, numberOfSets: Int, transparencyID: UUID, comments: String) {
        self.id = id
        self.preparationCompanyID = preparationCompanyID
        self.methodID = methodID
        self.wasScreened = wasScreened
        self.screenApertureID = screenApertureID
        self.oversizePulverizedSeparately = oversizePulverizedSeparately
        self.pulverizerID = pulverizerID
        self.pulverizingDurationSeconds = pulverizingDurationSeconds
        self.divisionMethodID = divisionMethodID
        self.numberOfSets = numberOfSets
        self.transparencyID = transparencyID
        self.comments = comments
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case preparationCompanyID
        case methodID
        case wasScreened
        case screenApertureID
        case oversizePulverizedSeparately
        case pulverizerID
        case pulverizingDurationSeconds
        case divisionMethodID
        case numberOfSets
        case transparencyID
        case comments
    }
}
