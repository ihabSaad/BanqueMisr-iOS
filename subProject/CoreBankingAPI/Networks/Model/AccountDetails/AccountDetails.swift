//
//  AccountDetails.swift
//  CoreBankingAPI
//
//  Created by ihab saad on 08/04/2026.
//



import Foundation

public struct AccountResponse: Codable {
    public let record: InnerRecord
    public let metadata: Metadata
}


public struct InnerRecord: Codable {
    public let record: [AccountDetails]
}

public struct Metadata: Codable {
    public let id: String?
    public let privateField: Bool?
    public let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case privateField = "private"
        case createdAt
    }
}
public struct AccountDetails: Codable {

    public let welcomeMessage: String?
    public let fullName: String?
    public let currentBalance: String?
    public let currency: String?
    public let accountNumber: String?
    public let cardHolderName: String?

    enum CodingKeys: String, CodingKey {
        case welcomeMessage = "welcome_message"
        case fullName = "full_name"
        case currentBalance = "current_balance"
        case currency
        case accountNumber = "account_number"
        case cardHolderName = "card_holder_name"
    }
}
