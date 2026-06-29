//
//  BankAlertManager.swift
//  DesignSystem
//
//  Created by ihab saad on 23/04/2026.
//


import UIKit

public class BankNotification: UIView {
    
    private let container = UIView()
    private let imageView = UIImageView()
    private let label = UILabel()

    public init(text: String) {
        super.init(frame: UIScreen.main.bounds)
        
        setupUI()
        configure(text: text)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setupUI() {
        
        backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        // Container (centered)
        container.frame = CGRect(x: 40,
                                 y: -120,
                                 width: frame.width - 80,
                                 height: 140)
        
        container.backgroundColor = .primary
        container.layer.cornerRadius = 18
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.15
        container.layer.shadowRadius = 12
        container.layer.shadowOffset = CGSize(width: 0, height: 6)
        
        // Image (centered top)
        imageView.frame = CGRect(x: (container.frame.width - 50) / 2,
                                 y: 15,
                                 width: 50,
                                 height: 50)
        
        imageView.image = UIImage(named: "Banque_Misr.svg")
        imageView.contentMode = .scaleAspectFit
        
        // Label (centered)
        label.frame = CGRect(x: 10,
                             y: 75,
                             width: container.frame.width - 20,
                             height: 50)
        
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        
        container.addSubview(imageView)
        container.addSubview(label)
        addSubview(container)
    }

    private func configure(text: String) {
        label.text = text
    }

    // MARK: - Show
    
    public func show(in vc: UIViewController) {
        
        vc.view.addSubview(self)
        
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       options: .curveEaseOut) {
            
            self.container.frame.origin.y = 100
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.hide()
        }
    }

    // MARK: - Hide
    
    private func hide() {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseIn) {
            
            self.container.frame.origin.y = -150
        } completion: { _ in
            self.removeFromSuperview()
        }
    }
}
