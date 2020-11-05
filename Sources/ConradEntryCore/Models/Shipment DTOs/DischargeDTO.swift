//
// ConradEntryCore
// Copyright © 2020 Jesse Halley. All rights reserved.
//

import Foundation

public struct DischargeDTO: Codable {
    public let id: UUID?
    public let methodID: Int
    public let startTime: Date
    public let finishTime: Date
    public let duration: TimeInterval
    public let dischargeRate: Double
    public let comments: String

    public init(id: UUID?, methodID: Int, startTime: Date, finishTime: Date, duration: TimeInterval, dischargeRate: Double, comments: String) {
        self.id = id
        self.methodID = methodID
        self.startTime = startTime
        self.finishTime = finishTime
        self.duration = duration
        self.dischargeRate = dischargeRate
        self.comments = comments
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case methodID
        case startTime
        case finishTime
        case duration
        case dischargeRate
        case comments
    }
}
