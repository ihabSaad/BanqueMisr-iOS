//
//  RegisterResponse.swift
//  CoreBankingAPI
//  Created by ihab saad on 04/03/2026.

import Foundation

public struct UserRecord: Codable {
 
    
  
    
    public var fullName: String?
    public var email: String?
    public var password: String?
    public var phoneNumber: String?
    public var dateOfBirth: String?
    
    public var id: String?
    public var createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case email
        case password
        case phoneNumber = "phone_number"
        case dateOfBirth = "date_of_birth"
        case id
        case createdAt
    }
    
    public init(fullName: String? = nil, email: String? = nil, password: String? = nil, phoneNumber: String? = nil, dateOfBirth: String? = nil, id: String? = nil, createdAt: String? = nil) {
        self.fullName = fullName
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber
        self.dateOfBirth = dateOfBirth
        self.id = id
        self.createdAt = createdAt
    }

}
   
