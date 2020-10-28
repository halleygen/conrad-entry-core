//
//  File.swift
//  
//
//  Created by Jesse Halley on 29/10/20.
//

import Foundation

public struct Signup: Codable {
    public var firstName: String
    public var lastName: String
    public var email: String
    public var password: String
    public var confirmPassword: String

    public enum CodingKeys: String, CodingKey {
        case firstName, lastName, email, password, confirmPassword
    }
    
    public init(firstName: String, lastName: String, email: String, password: String, confirmPassword: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
    }
}
