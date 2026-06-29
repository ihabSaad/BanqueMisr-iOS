//
//  EX - UIButton.swift
//  Banque Misr
//
//  Created by ihab saad on 25/02/2026.
//

import Foundation
import UIKit

extension UIButton {
    
    @IBInspectable
    var localizedSetTitle: String {
        
        set {self.setTitle(newValue.localized, for: .normal) }
        
        get { titleLabel?.text ?? ""}
    }
}


