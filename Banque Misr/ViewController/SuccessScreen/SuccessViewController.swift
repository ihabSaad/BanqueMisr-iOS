//
//  SuccessViewController.swift
//  Banque Misr
//
//  Created by ihab saad on 24/04/2026.
//

import UIKit
import CoreBankingAPI
import DesignSystem

class SuccessViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var fromNameLabel: UILabel!
    @IBOutlet weak private var toNameLabel: UILabel!
    @IBOutlet weak private var amountLabel: UILabel!


    @IBOutlet weak var successIcon: UIImageView! 
        @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBOutlet weak var backHomeButton: PrimaryButton!
    
    var finalData: MoneyTransferResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendTransactionNotification()
        setupInitialState()
        startTargetedAnimation() 
        setupData()
    }
    
    
    @IBAction func backHomeTapped(_ sender: Any) {
        
       
        let mainTabBarController = MainTabBarController()
            RootRouter.presentRoot(root: mainTabBarController)
    }
    
    
    private func sendTransactionNotification() {
        
        guard let record = finalData?.record.record else { return }
        
        let recipient = record.recipientName
        let amount = record.totalAmount
        let fees = record.transferFees
        
        let content = UNMutableNotificationContent()
        content.title = "Transfer Successful ✅"
        
        content.body = "You’ve successfully sent \(amount) to \(recipient). Fees: \(fees) ."
        content.sound = .default
        
        content.categoryIdentifier = "TRANSACTION_SUCCESS_CATEGORY"
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    private func setupData() {
        guard let record = finalData?.record.record else { return }
        
        fromNameLabel.text = record.senderName
        toNameLabel.text = record.recipientName
        
        amountLabel.text = "\(record.totalAmount)"
        
    
    }
    
    private func setupInitialState() {
            successIcon.alpha = 0
            successIcon.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
            statusLabel.alpha = 0
            statusLabel.transform = CGAffineTransform(translationX: 0, y: 20)
            
        }
        
        private func startTargetedAnimation() {
            
            UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.successIcon.alpha = 1
                self.successIcon.transform = .identity
            }) { _ in

                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.statusLabel.alpha = 1
                    self.statusLabel.transform = .identity
                }, completion: nil)
            }
        }
}
