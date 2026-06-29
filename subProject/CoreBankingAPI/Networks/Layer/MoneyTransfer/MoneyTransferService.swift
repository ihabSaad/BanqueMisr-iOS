//
//  MoneyTransferService.swift
//  CoreBankingAPI
//
//  Created by ihab saad on 23/04/2026.
//

import Foundation


public protocol MoneyTransferServiceProtocol {
    func transferMony(completion: @escaping (ResponseStatus<MoneyTransferResponse>) -> Void)
}


public class MoneyTransferService: MoneyTransferServiceProtocol{
    
    private let networkManager = NetworkManager()
    
    public init (){
        
    }
    
    public func transferMony(completion: @escaping (ResponseStatus<MoneyTransferResponse>) -> Void) {
        let endPoint = EndPoint(path: Constant.Paths.moneyTransfer, httpMethod: .get)
        networkManager.request(of: MoneyTransferResponse.self, endPoint: endPoint, completion: completion)
    }
    
    
}
