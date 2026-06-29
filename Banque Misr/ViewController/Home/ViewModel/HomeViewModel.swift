//
//  HomeViewModel.swift
//  Banque Misr
//  Created by ihab saad on 08/04/2026.

import Foundation
import CoreBankingAPI
import RxSwift


enum AccountDetailsState {
    case success(AccountDetails)
    case failure(message: String)
    case loading
}

enum TransactionState {
    case showLoading
    case hideLoading
    case success([Transaction])
    case failure(message: String)
}


class HomeViewModel {

    private let accountRepo: AccountDetailsRepo
    private let transactionRepo: TransactionRepo
    private let disposeBag = DisposeBag()

    var publishAccountDetails = PublishSubject<AccountDetailsState>()
    var transactionsState = PublishSubject<TransactionState>()

    var transactions: [Transaction] = []

    init(accountRepo: AccountDetailsRepo = AccountDetailsRepo(),
         transactionRepo: TransactionRepo = TransactionRepo()) {

        self.accountRepo = accountRepo
        self.transactionRepo = transactionRepo
    }

    // MARK: - Account
    func getAccountDetails() {

        publishAccountDetails.onNext(.loading)

        accountRepo.getAccountDetails { [weak self] response in
            guard let self = self else { return }

            switch response {

            case .success(let data):

                guard let account = data.record.record.first else {
                    self.publishAccountDetails.onNext(.failure(message: "No accounts found"))
                    return
                }

                self.publishAccountDetails.onNext(.success(account))

            case .failure(let message):
                self.publishAccountDetails.onNext(.failure(message: message))
            }
        }
    }

    // MARK: - Transactions
    func fetchTransactions() {

        transactionsState.onNext(.showLoading)

        transactionRepo.getAllTransactions { [weak self] response in
            guard let self = self else { return }

            self.transactionsState.onNext(.hideLoading)

            switch response {

            case .success(let data):

                self.transactions = data.record
                self.transactionsState.onNext(.success(data.record))

            case .failure(let error):
                self.transactionsState.onNext(.failure(message: error))
            }
        }
    }
}
