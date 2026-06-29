//
//  UIViewController.swift
//  DesignSystem
//
//  Created by ihab saad on 14/03/2026.

import UIKit

extension UIViewController {
    
   public func showAlert(title: String, message: String, buttonTitle: String = "OK") {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
