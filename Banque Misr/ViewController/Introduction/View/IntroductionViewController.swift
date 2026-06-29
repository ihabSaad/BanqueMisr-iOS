//
//  IntroductionViewController.swift
//  Banque Misr
//
//  Created by ihab saad on 25/02/2026.
//

import UIKit

class IntroductionViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startZoomAnimation()
    }
   
    
     func startZoomAnimation() {
        imageView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        
        UIView.animate(withDuration: 3.0, delay: 0, options: [.curveLinear, .autoreverse, .repeat], animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }, completion: nil)
    }
    @IBAction func presentSignIn(_ sender: Any) {
        let loginViewController = LoginViewController()
        RootRouter.presentRoot(root: loginViewController)
    }
    
    @IBAction func presentSignUp(_ sender: Any) {
        let registerViewController = RegisterViewController()
        RootRouter.presentRoot(root: registerViewController)
    }
}
