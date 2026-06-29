//
//  OnBoardingViewModel.swift
//  Banque Misr
//
//  Created by ihab saad on 25/02/2026.
//

import Foundation
import UIKit


class OnBoardingViewModel {
    
    var list: [List] = [
        .init(image: UIImage(named: "1")!, title: "OnBoarding.Title.1".localized, description: "OnBoarding.Desc.1".localized),
        .init(image: UIImage(named: "2")!, title: "OnBoarding.Title.2".localized, description: "OnBoarding.Desc.2".localized),
        .init(image: UIImage(named: "3")!, title: "OnBoarding.Title.3".localized, description: "OnBoarding.Desc.3".localized)
    ]
}
