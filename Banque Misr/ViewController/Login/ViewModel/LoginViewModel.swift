//
//  LoginViewModel.swift
//  Banque Misr
//
//  Created by ihab saad on 31/12/2025.
//

import Foundation
import RxSwift
import CoreBankingAPI

import Foundation
import RxSwift
import CoreBankingAPI

enum LoginState {
    case showLoading
    case hideLoading
    case success
    case failure(message: String)
}

class LoginViewModel {
    
    private let loginRepo: LoginRepo
    let loginState = PublishSubject<LoginState>()
    
    init(loginRepo: LoginRepo = LoginRepo()) {
        self.loginRepo = loginRepo
    }

    func login(email: String, password: String) {
        loginState.onNext(.showLoading)
        
        let formData = LoginForm(email: email, password: password)
        
        loginRepo.login(form: formData) { [weak self] status in
            guard let self = self else { return }
            self.loginState.onNext(.hideLoading)
            
            switch status {
            case .success(let data):
                self.loginState.onNext(.success)
                print("Login success: \(data)")
            case .failure(let error):
                self.loginState.onNext(.failure(message: error))
            }
        }
    }
}
