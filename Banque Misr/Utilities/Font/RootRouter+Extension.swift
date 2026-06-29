//
//  RootRouter+Extension.swift
//  Banque Misr
//
//  Created by ihab saad on 19/02/2026.


import Foundation
import UIKit
public class RootRouter {
    
    public static func presentRoot(root: UIViewController) {
        
        // For iOS 13+
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first {
            window.rootViewController = root
            window.makeKeyAndVisible()
        
        }
        // For iOS < 13 
        else if let window = UIApplication.shared.delegate?.window ?? nil {
            window.rootViewController = root
            window.makeKeyAndVisible()
        }
    }
}
