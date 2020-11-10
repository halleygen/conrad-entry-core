//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct QualityLotSamplePreparationDTO: Codable, Hashable, Identifiable {
    public let id: UUID?
    public let preparationCompanyID: Int
    public let methodID: Int
    public let wasScreened: Bool
    public let screenApertureID: Int?
    public let oversizePulverizedSeparately: Bool?
    public let pulverizerID: Int
    public let pulverizingDurationSeconds: TimeInterval
    public let divisionMethodID: Int
    public let numberOfSets: Int
    public let transparencyID: Int
    public let comments: String

    public init(id: UUID?, preparationCompanyID: Int, methodID: Int, wasScreened: Bool, screenApertureID: Int?, oversizePulverizedSeparately: Bool?, pulverizerID: Int, pulverizingDurationSeconds: TimeInterval, divisionMethodID: Int, numberOfSets: Int, transparencyID: Int, comments: String) {
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
