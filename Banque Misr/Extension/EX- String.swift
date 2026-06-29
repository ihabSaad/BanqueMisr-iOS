//
//  EX- String.swift
//  Banque Misr
//
//  Created by ihab saad on 25/02/2026.
//

import Foundation


extension String {
    
    var localized: String {
        return Bundle.main.localizedString(forKey: self, value: "", table: nil)
    }
    
    func getLocalized(rang: CVarArg...) -> String {
        return String.init(format: self.localized, rang)
    }
}


extension String {
    
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
