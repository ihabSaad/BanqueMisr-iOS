//
//  MainTabBarController.swift
//  Banque Misr
//
//  Created by ihab saad on 25/04/2026.
//

import UIKit
import DesignSystem

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        setupViewControllers()
    }
    
    private func configureTabBar() {
        tabBar.tintColor = UIColor(named: "Primary")
        tabBar.unselectedItemTintColor = .systemGray
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
    private func setupViewControllers() {
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(named: "home"),
            selectedImage: UIImage(named: "home")
        )
        let homeNav = UINavigationController(rootViewController: homeVC)
        
        let transferVC = TransferViewController()
        transferVC.view.backgroundColor = .systemBackground
        transferVC.tabBarItem = UITabBarItem(
            title: "Transfer",
            image: UIImage(named: "Transfer 1"),
            selectedImage: UIImage(named: "Transfer 1")
        )
        let transferNav = UINavigationController(rootViewController: transferVC)
        
        let historyVC = UIViewController() // استبدلها بكلاس الـ History بتاعك
        historyVC.view.backgroundColor = .systemBackground
        historyVC.tabBarItem = UITabBarItem(
            title: "History",
            image: UIImage(named: "History 1"),
            selectedImage: UIImage(named: "History 1")
        )
        let historyNav = UINavigationController(rootViewController: historyVC)
        
        let shopVC = UIViewController()
        shopVC.view.backgroundColor = .systemBackground
        shopVC.tabBarItem = UITabBarItem(
            title: "Shop",
            image: UIImage(named: "Ecommerce-transfer money-buy-smartphone-hands"),
            selectedImage: UIImage(named: "Ecommerce-transfer money-buy-smartphone-hands")
        )
        let shopNav = UINavigationController(rootViewController: shopVC)
        
        viewControllers = [homeNav, transferNav, historyNav, shopNav]
    }
}
