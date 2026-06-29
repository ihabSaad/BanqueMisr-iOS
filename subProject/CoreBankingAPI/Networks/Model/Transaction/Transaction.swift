//
//  Transaction.swift
//  CoreBankingAPI
//
//  Created by ihab saad on 09/04/2026.
//

import Foundation

public struct TransactionsResponse: Codable {
    public let record: [Transaction]
}

public struct Transaction: Codable {
    public let id: String
    public let senderName: String
    public let cardInfo: String
    public let date: String
    public let amount: String
}
