//
//  TransferDraft.swift
//  CoreBankingAPI
//
//  Created by ihab saad on 23/04/2026.
//

import Foundation

public struct TransferDraft {

    public  let amount: Double
    public  let recipient: String
    
    public  init(amount: Double, recipient: String) {
        self.amount = amount
        self.recipient = recipient
    }

}
