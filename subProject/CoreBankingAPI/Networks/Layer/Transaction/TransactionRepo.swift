//
//  TransactionRepo.swift
//  CoreBankingAPI
//
//  Created by ihab saad on 09/04/2026.
//

import Foundation


public class TransactionRepo {

    private let service: TransactionServiceProtocol

    public init(service: TransactionServiceProtocol = TransactionService()) {
        self.service = service
    }

    public func getAllTransactions(completion: @escaping (ResponseStatus<TransactionsResponse>) -> Void) {
        service.getAllTransactions(completion: completion)
    }
}
