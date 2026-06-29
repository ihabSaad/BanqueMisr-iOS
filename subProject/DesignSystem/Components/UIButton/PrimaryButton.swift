//
//  PrimaryButton.swift
//  DesignSystem
//
//  Created by ihab saad on 26/02/2026.
//

import UIKit

public class PrimaryButton: UIButton {
    
    private let gradient = CAGradientLayer()
    private var bundleIdentifier = Bundle(identifier: "ihabAl-Amir.com.DesignSystem")
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpButton()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = self.bounds
    }
    
    private func setUpButton() {
        setTitleColor(.white, for: .normal)
      
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        layer.cornerRadius = 5
        layer.masksToBounds = true

        guard let bundle = bundleIdentifier,
              let color1 = UIColor(named: "Primary", in: bundle, compatibleWith: nil),
              let color2 = UIColor(named: "PrimaryP75", in: bundle, compatibleWith: nil) else {
            return
        }
        
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.startPoint = CGPoint(x: 1, y: 0.5)
        gradient.endPoint   = CGPoint(x: 0, y: 0.5)
        
        if gradient.superlayer == nil {
            layer.insertSublayer(gradient, at: 0)
        }
    }
}



