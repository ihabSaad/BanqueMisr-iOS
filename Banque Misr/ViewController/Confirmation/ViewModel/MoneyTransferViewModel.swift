//
//  MoneyTransferViewModel.swift
//  Banque Misr
//
//  Created by ihab saad on 23/04/2026.
//

import Foundation
import RxSwift
import RxRelay
import CoreBankingAPI


enum TransferState {
    case idle
    case loading
    case success(MoneyTransferResponse)
    case error(String)
}

class MoneyTransferViewModel {
    
    private let repo = MoneyTransferRepo()
    private let disposeBag = DisposeBag()
    
    let state = PublishSubject<TransferState>()
    
    func getMoneyTransferData() {
        
        state.onNext(.loading)
        
        repo.transferMoney { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                self.state.onNext(.success(data))
                
            case .failure(let message):
                self.state.onNext(.error(message))
            }
        }
    }
}
