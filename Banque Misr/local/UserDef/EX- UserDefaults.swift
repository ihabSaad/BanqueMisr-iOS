//
//  EX- UserDefaults.swift
//  Banque Misr
//
//  Created by ihab saad on 25/02/2026.
//

import Foundation

enum UserDefaultsKeys: String {
    case isShowOnBoarding = "isShowOnBoarding"
}

 extension UserDefaults {
   
    
    func setKeys(key: UserDefaultsKeys, value: Any ) {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(value, forKey: key.rawValue)
        userDefaults.synchronize()
    }
    
    func getBool(key: UserDefaultsKeys) -> Bool {
        let userDefaults = UserDefaults.standard
        return  userDefaults.bool(forKey: key.rawValue)

    }
}
