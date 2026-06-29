//
//  RegisterRepo.swift
//  CoreBankingAPI
//
//  Created by ihab saad on 04/03/2026.
//

import Foundation


public class RegisterRepo {
    
    
       let service: RegisterServiceProtocol
       
       public init(service: RegisterServiceProtocol = RegisterService()) {
           self.service = service
       }
    
    public  func register(user: UserRecord, completion: @escaping (ResponseStatus<UserRecord>) -> Void) {
        
        service.register(user: user, completion: completion)
    }
}
