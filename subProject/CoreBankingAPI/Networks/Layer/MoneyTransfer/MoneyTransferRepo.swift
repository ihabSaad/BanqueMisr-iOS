//
//  MoneyTransferRepo.swift
//  CoreBankingAPI
//
//  Created by ihab saad on 23/04/2026.
//

import Foundation

public class MoneyTransferRepo {
    
    
    let service: MoneyTransferServiceProtocol
    
    public  init(service: MoneyTransferServiceProtocol = MoneyTransferService()) {
        self.service = service
    }
    public func transferMoney(completion: @escaping (ResponseStatus<MoneyTransferResponse>) -> Void) {
        
        service.transferMony(completion: completion)
    }
}
