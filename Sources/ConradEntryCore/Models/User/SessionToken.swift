//
//  File.swift
//  
//
//  Created by Jesse Halley on 29/10/20.
//

import Foundation

public struct SessionToken: Codable, Hashable {
    public let userID: UUID
    public let value: String
    public let expiryDate: Date
    
    public init(userID: UUID, value: String, expiryDate: Date) {
        self.userID = userID
        self.value = value
        self.expiryDate = expiryDate
    }
}
