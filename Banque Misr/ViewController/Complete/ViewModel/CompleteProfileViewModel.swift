//
//  CompleteProfileViewModel.swift
//  Banque Misr
//
//  Created by ihab saad on 05/03/2026.
//

import Foundation
import CoreBankingAPI
import RxSwift


enum CompleteProfileState {
    case loading
    case success(UserRecord)
    case failure(message: String)
}

class CompleteProfileViewModel {
    private let repo = RegisterRepo()
    let registerState = PublishSubject<CompleteProfileState>()
    
    func register(user: UserRecord) {
        print("🛰 ViewModel: Calling Repo...")
        repo.register(user: user) { [weak self] response in
            DispatchQueue.main.async {
                switch response {
                case .success(let data):
                    print("Success User")
                    self?.registerState.onNext(.success(data))
                case .failure(let message):
                    print("Failure: \(message)")
                    self?.registerState.onNext(.failure(message: message))
                }
            }
        }
    }
}
