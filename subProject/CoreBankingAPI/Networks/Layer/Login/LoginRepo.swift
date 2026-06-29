//
//  LoginRepo.swift
//  Banque Misr
//
//  Created by ihab saad on 31/12/2025.
//

import Foundation




public class LoginRepo {
    
    
    private let service: LoginServiceProtocol
    
    public   init(service: LoginServiceProtocol = LoginService()) {
        self.service = service
    }
    
    public func login(form: LoginForm, completion: @escaping (ResponseStatus<LoginResponse>) -> Void) {
        service.login(form: form) { result in
            switch result {
            case let.success(data):
                completion(.success(data))
            case let.failure(Message):
                completion(.failure(message: Message))
            }
        }
    }
}
