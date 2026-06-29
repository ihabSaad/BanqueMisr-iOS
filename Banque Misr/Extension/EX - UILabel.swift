//
//  EX - UILabel.swift
//  Banque Misr
//
//  Created by ihab saad on 25/02/2026.
//

import Foundation
import UIKit

extension UILabel {
    
    @IBInspectable
    var localizedText: String {
        
        set {self.text = newValue.localized}
        get { self.text ?? ""   }
    }
}


