//
//  ConfirmationViewController.swift
//  Banque Misr
//
//  Created by ihab saad on 23/04/2026.
//

import UIKit
import CoreBankingAPI
import DesignSystem
import RxSwift

class ConfirmationViewController: UIViewController {

    
    // MARK: - IBOutlets
        @IBOutlet weak private var amountLabel: UILabel!
        @IBOutlet weak private var totalAmountLabel: UILabel!
        
        @IBOutlet weak private var senderNameLabel: UILabel!
        @IBOutlet weak private var senderAccountLabel: UILabel!
        
        @IBOutlet weak private var recipientNameLabel: UILabel!
        @IBOutlet weak private var recipientAccountLabel: UILabel!
        
        @IBOutlet weak private var confirmButton: UIButton!
        @IBOutlet weak private var previousButton: UIButton!
    
        @IBOutlet weak private var fromCardView: UIView!
        @IBOutlet weak private var TwoCardView: UIView!
    
    
    // MARK: - Properties
     var transferDraft: TransferDraft?
    private var transferData: MoneyTransferResponse?
    private let viewModel = MoneyTransferViewModel()
    private let disposeBag = DisposeBag()
    
        // MARK: - LifeCycle
    
        override func viewDidLoad() {
            super.viewDidLoad()
            displayData()
            bindViewModel()
            viewModel.getMoneyTransferData()
        }
    
    
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        
        guard let details = transferData?.record.record else { return }

                let alertMessage = """
                Recipient: \(details.recipientName)
                Account: \(details.recipientAccountNumber)
                Amount: \(details.totalAmount)
                Fees: \(details.transferFees)
                
                Are you sure you want to proceed with this transaction?
                """

                let alert = UIAlertController(
                    title: "Confirm Transaction",
                    message: alertMessage,
                    preferredStyle: .alert
                )

                let confirmAction = UIAlertAction(title: "Confirm & Send", style: .default) { _ in
                    self.navigateToSuccessScreen()
                }

                let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)

                alert.addAction(confirmAction)
                alert.addAction(cancelAction)
                
                present(alert, animated: true)
            }
    
    
    private func displayData() {
            guard let details = transferData?.record.record else { return }
            
            amountLabel.text = details.totalAmount
            totalAmountLabel.text = details.totalAmount
            
            recipientNameLabel.text = details.recipientName
            let last4 = String(details.recipientAccountNumber.suffix(4))
            recipientAccountLabel.text = "Account xxxx\(last4)"
            
            senderNameLabel.text = details.senderName
            senderAccountLabel.text = details.senderAccountNumber
            
            animateTransfer()
        }
        
        private func bindViewModel() {
            viewModel.state
                .observe(on: MainScheduler.instance)
                .subscribe(onNext: { [weak self] state in
                    guard let self = self else { return }
                    
                    switch state {
                    case .idle: break
                    case .loading:
                        self.confirmButton.isEnabled = false
                        print("Loading data...")
                    case .success(let response):
                        self.confirmButton.isEnabled = true
                        self.transferData = response
                        self.displayData()
                    case .error(let message):
                        self.confirmButton.isEnabled = true
                        print("Error: \(message)")
                    }
                })
                .disposed(by: disposeBag)
        }

        private func animateTransfer() {
            self.recipientNameLabel.alpha = 0.0
            UIView.animate(withDuration: 1.0, delay: 0.2, options: .curveEaseIn, animations: {
                self.recipientNameLabel.alpha = 1.0
            }, completion: nil)
        }
        
        private func navigateToSuccessScreen() {
            let successViewController = SuccessViewController()
            successViewController.finalData = self.transferData
            RootRouter.presentRoot(root: successViewController)
            
        }
    }

    // MARK: - Screenshot Protection Extension
    extension UIView {
        func makeSecure() {
            let field = UITextField()
            field.isSecureTextEntry = true
            self.addSubview(field)
            field.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            field.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            field.layer.sublayers?.first?.addSublayer(self.layer)
        }
    }
