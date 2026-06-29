//
//  SplashScreenViewController.swift
//  Banque Misr
//
//  Created by ihab saad on 31/12/2025.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            if  UserDefaults().getBool(key: .isShowOnBoarding) == true{
                self.navigateToHomeVC()
            }else {
                self.navigateToHomeVC()
            }
          
        }
    }
    
    private func navigateToOnBoardingVC(){
        let onBoardingViewController = OnBoardingViewController()
        RootRouter.presentRoot(root: onBoardingViewController)
    }
    private func navigateToHomeVC(){
        let homeViewController = HomeViewController()
        RootRouter.presentRoot(root: homeViewController)
    }
    private func navigateToLoginVCScreen(){
        let loginVC = LoginViewController()
        RootRouter.presentRoot(root: loginVC)
    }
   
}
