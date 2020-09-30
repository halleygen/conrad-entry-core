//
//  File.swift
//  
//
//  Created by Jesse Halley on 30/9/20.
//

public struct WeighingMethod: Codable {
    public let value: String
    public let usesEquipment: Bool
    public let supportsABCChecks: Bool
}

public extension WeighingMethod {
    enum CodingKeys: String, CodingKey {
        case supportsABCChecks, value, usesEquipment
    }
}
