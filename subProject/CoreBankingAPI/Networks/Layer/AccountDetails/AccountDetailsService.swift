//
//  AccountDetailsService.swift
//  CoreBankingAPI
//
//  Created by ihab saad on 08/04/2026.
//

import Foundation

public protocol AccountDetailsProtocol {
    func getAccountDetails(completion: @escaping (ResponseStatus<AccountResponse>) -> Void)
}

public class AccountDetailsService: AccountDetailsProtocol {

    private let networkManager = NetworkManager()

    public init() {}

    public func getAccountDetails(completion: @escaping (ResponseStatus<AccountResponse>) -> Void) {

        let endPoint = EndPoint(
            path: Constant.Paths.accountDetails,
            httpMethod: .get
        )

        networkManager.request(of: AccountResponse.self,
                               endPoint: endPoint,
                               completion: completion)
    }
}
