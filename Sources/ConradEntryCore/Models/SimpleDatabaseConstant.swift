//
//  File.swift
//  
//
//  Created by Jesse Halley on 29/10/20.
//

import Foundation

public struct SimpleConstant: Codable, Hashable, Identifiable {
    public var id: UUID
    public var value: String
    
    public init(id: UUID, value: String) {
        self.id = id
        self.value = value
    }
}
