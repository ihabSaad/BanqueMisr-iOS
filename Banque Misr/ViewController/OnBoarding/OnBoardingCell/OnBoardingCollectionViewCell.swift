//
//  OnBoardingCollectionViewCell.swift
//  Banque Misr
//
//  Created by ihab saad on 25/02/2026.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {

    
    // MARK: - OutLets
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    // MARK: - configure List
  public func configure( list: List){
        imageView.image = list.image
        titleLabel.text = list.title
        descriptionLabel.text = list.description
    }
}

