//
//  LoginService.swift
//  Banque Misr
//
//  Created by ihab saad on 31/12/2025.
//

import Foundation

public protocol LoginServiceProtocol {
    
       func login(form: LoginForm, completion: @escaping (ResponseStatus<LoginResponse>) -> Void)
    
}

public class LoginService: LoginServiceProtocol {
    
    public  init () {
        
    }
    public   func login(form: LoginForm, completion: @escaping (ResponseStatus<LoginResponse>) -> Void) {
        let endPoint = EndPoint(path: Constant.Paths.registerEndpoint, httpMethod: .post, body: form)
        NetworkManager().request(of: LoginResponse.self, endPoint: endPoint, completion: completion)
    }
}
