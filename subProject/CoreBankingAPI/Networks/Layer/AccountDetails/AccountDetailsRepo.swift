//
//  AccountDetailsRepo.swift
//  CoreBankingAPI
//
//  Created by ihab saad on 08/04/2026.
//

public class AccountDetailsRepo {

    private let service: AccountDetailsProtocol

    public init(service: AccountDetailsProtocol = AccountDetailsService()) {
        self.service = service
    }

    public func getAccountDetails(completion: @escaping (ResponseStatus<AccountResponse>) -> Void) {
        print("➡️ Repo: Calling Service...")
        service.getAccountDetails(completion: completion)
    }
}
