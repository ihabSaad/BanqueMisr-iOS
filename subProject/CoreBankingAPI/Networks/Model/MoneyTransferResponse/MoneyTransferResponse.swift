//
//  MoneyTransferResponse.swift
//  CoreBankingAPI
//
//  Created by ihab saad on 23/04/2026.
//

import Foundation


public struct MoneyTransferResponse: Codable {
    public let record: NestedRecord
}

public struct NestedRecord: Codable {
    public let record: TransferDetails
}

public struct TransferDetails: Codable {
    public let recipientName: String
    public let recipientAccountNumber: String
    public let senderName: String
    public let senderAccountNumber: String
    public let transferFees: String
    public let totalAmount: String
    public let status: String

    enum CodingKeys: String, CodingKey {
        case recipientName = "recipient_name"
        case recipientAccountNumber = "recipient_account_number"
        case senderName = "sender_name"
        case senderAccountNumber = "sender_account_number"
        case transferFees = "transfer_fees"
        case totalAmount = "total_amount"
        case status
    }
}
