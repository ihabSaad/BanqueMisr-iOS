//
//  RegisterViewController.swift
//  Banque Misr
//
//  Created by ihab saad on 21/02/2026.
//

import UIKit
import CoreBankingAPI
import DesignSystem

class RegisterViewController: UIViewController {
    
    
    // MARK: - Outlets
    @IBOutlet weak private var fullNameTextField: UITextField!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var confirmPasswordTextField: UITextField!
    
  
    // MARK: - Properties
    private let viewModel = RegisterViewModel()
  
    
    // MARK: - Initializer
    init() {
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func ContinueAction(_ sender: Any) {
         
        let fullName = fullNameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        let phone: String? = nil
         
       
        // Validate password confirmation
        guard passwordTextField.text == confirmPasswordTextField.text else {
            print("Passwords don't match")
            return
        }
        
        if let errorMessage = viewModel.validate(
                   fullName: fullName,
                   email: email,
                   password: password,
                   confirmPassword: confirmPassword, phone: phone
               ) {
            
            showAlert(title: "Validation Error", message: errorMessage)
                   return
               }
               
        let userData = UserRecord(
            fullName: fullName,
            email: email,
            password: password,
            phoneNumber: nil,
            dateOfBirth: nil
        )
               
               let completeProfileVC = CompleteProfileViewController()
               completeProfileVC.receivedData = userData
               RootRouter.presentRoot(root: completeProfileVC)
           }
       }
