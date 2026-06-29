//
//  TransferViewController.swift
//  Banque Misr
//
//  Created by ihab saad on 14/04/2026.
//

import UIKit
import DesignSystem
import ContactsUI
import RxSwift
import CoreBankingAPI

final class TransferViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var amountCardView: UIView!
    @IBOutlet private weak var recipientCardView: UIView!
    
    @IBOutlet private weak var amountTextField: UITextField!
    @IBOutlet private weak var recipientTextField: UITextField!
    
    @IBOutlet private weak var availableBalanceLabel: UILabel!
    
    @IBOutlet private weak var favouriteButton: UIButton!
    @IBOutlet private weak var phoneTabButton: UIButton!
    
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var stackViewFavEdit: UIStackView!
    
    
    // MARK: - Properties
    
    private let totalBalance: Double = 25000.0
    private let disposeBag = DisposeBag()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureActions()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let savedNote = UserDefaults.standard.string(forKey: "latest_transaction_note") {
            
            let notification = BankNotification(text: "Transaction Note: \(savedNote)")
            
            notification.show(in: self)
            
            UserDefaults.standard.removeObject(forKey: "latest_transaction_note")
        }
    }

}

// MARK: - UI Configuration
private extension TransferViewController {
    
    func configureUI() {
        navigationItem.title = "Transfer"
        setupTextFields()
        setupSegmentedControl()
        
        phoneTabButton.isHidden = true
        updateBalanceUI(remaining: totalBalance)
    }
    
  
    
    func setupTextFields() {
        amountTextField.placeholder = "Enter amount (EGP 0.00)"
        recipientTextField.placeholder = "Enter 14-digit account number"
    }
    
    func setupSegmentedControl() {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 14, weight: .bold)
        ]
        
        segmentedControl.setTitleTextAttributes(attributes, for: .selected)
    }
}

// MARK: - Actions Setup
private extension TransferViewController {
    
    func configureActions() {
        amountTextField.addTarget(self,
                                  action: #selector(handleAmountChange),
                                  for: .editingChanged)
    }
}

// MARK: - IBActions
extension TransferViewController {
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        updateRecipientUI(for: sender.selectedSegmentIndex)
    }
    
    @IBAction func phoneButtonTapped(_ sender: UIButton) {
        openContacts()
    }
    
    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        
        let amountText = amountTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let recipientText = recipientTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        // 1. Validation
        if amountText.isEmpty {
            BankNotification(text: "Enter transfer amount").show(in: self)
            return
        }
        
        guard let amount = Double(amountText), amount > 0 else {
            BankNotification(text: "Enter valid amount").show(in: self)
            return
        }
        if recipientText.isEmpty {
            BankNotification(text: "Enter recipient details").show(in: self)
            return
        }
        

        let draft = TransferDraft(
            amount: amount,
            recipient: recipientText
            
        )
        
        let vc = ConfirmationViewController()
        vc.transferDraft = draft
        RootRouter.presentRoot(root: vc)
        
    }
}

// MARK: - Business Logic
private extension TransferViewController {
    

    
    @objc func handleAmountChange() {
        let enteredAmount = Double(amountTextField.text ?? "") ?? 0.0
        let remaining = totalBalance - enteredAmount
        
        updateBalanceUI(remaining: remaining)
    }
    
    func updateBalanceUI(remaining: Double) {
        if remaining >= 0 {
            availableBalanceLabel.text = "Available Balance: EGP \(remaining)"
            availableBalanceLabel.textColor = .darkGray
        } else {
            availableBalanceLabel.text = "Insufficient Balance! 🚨"
            availableBalanceLabel.textColor = .systemRed
            availableBalanceLabel.font = .boldSystemFont(ofSize: 12)
            animateShake(on: availableBalanceLabel)
        }
    }
    
    func updateRecipientUI(for index: Int) {
        
        if index == 0 {
            
            // Account
            
            favouriteButton.isHidden = false
            phoneTabButton.isHidden = true
            stackViewFavEdit.isHidden = false
            
            recipientTextField.placeholder = "Enter 14 digit account number"
            recipientTextField.keyboardType = .numberPad
            
        } else {
            
            // Mobile
            favouriteButton.isHidden = true
            phoneTabButton.isHidden = false
            stackViewFavEdit.isHidden = true
            
            recipientTextField.placeholder = "Enter mobile number"
            recipientTextField.keyboardType = .phonePad
        }
        
        recipientTextField.text = ""
    }
}

// MARK: - Contact Picker
extension TransferViewController: CNContactPickerDelegate {
    
    func openContacts() {
        let picker = CNContactPickerViewController()
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController,
                       didSelect contact: CNContact) {
        
        let number = contact.phoneNumbers.first?.value.stringValue ?? ""
        recipientTextField.text = number
    }
}

// MARK: - Animations
private extension TransferViewController {
    
    func animateShake(on view: UIView) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        
        animation.fromValue = NSValue(
            cgPoint: CGPoint(x: view.center.x - 5, y: view.center.y)
        )
        
        animation.toValue = NSValue(
            cgPoint: CGPoint(x: view.center.x + 5, y: view.center.y)
        )
        
        view.layer.add(animation, forKey: "position")
    }
}
