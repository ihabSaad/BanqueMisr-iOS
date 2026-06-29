//
//  TransactionService.swift
//  CoreBankingAPI
//  Created by ihab saad on 09/04/2026.

public protocol TransactionServiceProtocol {
    func getAllTransactions(completion: @escaping (ResponseStatus<TransactionsResponse>) -> Void)
}

public class TransactionService: TransactionServiceProtocol {

    private let networkManager = NetworkManager()

    public init() {}

    public func getAllTransactions(completion: @escaping (ResponseStatus<TransactionsResponse>) -> Void) {

        let endPoint = EndPoint(
            path: Constant.Paths.transactions,
            httpMethod: .get
        )

        networkManager.request(of: TransactionsResponse.self,
                               endPoint: endPoint,
                               completion: completion)
    }
}
