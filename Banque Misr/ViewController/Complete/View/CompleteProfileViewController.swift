//
//  CompleteProfileViewController.swift
//  Banque Misr
//
//  Created by ihab saad on 04/03/2026.
//

import UIKit
import CoreBankingAPI
import DesignSystem
import RxSwift


class CompleteProfileViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak private var phoneTextField: UITextField!
    @IBOutlet weak private var dateOfBirthTextField: UITextField!
    
    
    // MARK: - Properties
        var receivedData: UserRecord?
        private lazy var viewModel = CompleteProfileViewModel()
        private let disposeBag = DisposeBag()
        
        // MARK: - Init
        init() {
            super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Lifecycle Methods
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            subscribe() 
        }
    }

    // MARK: - UI Setup
    extension CompleteProfileViewController {
        private func setupUI() {
            title = "Complete Profile"
            dateOfBirthTextField.delegate = self
        }
    }

    // MARK: - Actions
    extension CompleteProfileViewController {
        @IBAction private func registerTapped(_ sender: Any) {
            handleFinalRegistration()
        }
    }

    // MARK: - Logic & Binding
    extension CompleteProfileViewController {
        
        private func handleFinalRegistration() {
            guard var finalUser = receivedData else {
                print("Error: No data received from first screen")
                return
            }
            
            finalUser.phoneNumber = phoneTextField.text ?? ""
            finalUser.dateOfBirth = dateOfBirthTextField.text ?? ""
            
            viewModel.register(user: finalUser)
        }
        
        private func subscribe() {
            viewModel.registerState
                .subscribe(onNext: { [weak self] state in
                    print(" Received State Update")
                    switch state {
                    case .loading:
                        print("Loading...")
                        
                    case .success(let user):
                        self?.navigateToSignIn()
                        
                    case .failure(let message):
                        print(" Show Error: \(message)")
                        self?.navigateToSignIn()
                    }
                })
                .disposed(by: disposeBag)
        }
    }

    // MARK: - Navigation & Helpers
    extension CompleteProfileViewController {
        private func navigateToSignIn() {
            let mainTabBarController = MainTabBarController()
            RootRouter.presentRoot(root: mainTabBarController)
        }
    }

extension CompleteProfileViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == dateOfBirthTextField {
            
            let vc = DatePickerViewController()
            
            vc.didSelectDate = { [weak self] date in
                guard let self = self else { return }
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy"
                
                self.dateOfBirthTextField.text = formatter.string(from: date)
            }
            vc.modalTransitionStyle = .crossDissolve
           present(vc, animated: true)
            
            return false
        }
        
        return true
    }
}
