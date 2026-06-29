//
//  LoginForm.swift
//  Banque Misr
//  Created by ihab saad on 31/12/2025.

import Foundation


public struct LoginForm: Codable {

    var email: String
    var password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
