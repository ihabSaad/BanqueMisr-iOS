//
//  LoginViewController.swift
//  Banque Misr
//
//  Created by ihab saad on 31/12/2025.
//

import UIKit
import RxSwift


class LoginViewController: UIViewController {
    
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextFields: UITextField!
    
    private var viewModel = LoginViewModel()
    private  var disposeBag = DisposeBag()
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextFields.isSecureTextEntry = true
        passwordTextFields.textContentType = .password
        emailTextField.textAlignment = .natural
        passwordTextFields.textAlignment = .natural
        subscribeToViewModel()
    }
    
    private func subscribeToViewModel(){
        viewModel.loginState.subscribe(onNext: { element in
            
            switch element {
                
            case .showLoading : print("showLoading")
            case .hideLoading : print("hideLoading")
            case .success :    print("success")
            case let .failure(message: message): print("\(message)")
            default :
                break
            }
            
            
        }).disposed(by: disposeBag)
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextFields.text ?? ""
        viewModel.login(email: email, password: password)
    }
}




