//
//  File.swift
//  
//
//  Created by Jesse Halley on 29/10/20.
//

extension User {
public struct Priviledges: OptionSet, Codable, Hashable {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let editConfigurationConstants = Priviledges(rawValue: 1 << 0)
    public static let readAllShipments = Priviledges(rawValue: 1 << 1)
    public static let writeAllShipments = Priviledges(rawValue: 1 << 2)
    public static let manageUsers = Priviledges(rawValue: 1 << 3)

    public static let none: Priviledges = []
    public static let administrator: Priviledges = [.readAllShipments, .writeAllShipments, .editConfigurationConstants]
    public static let superuser: Priviledges = [.administrator, .manageUsers]
}
}
