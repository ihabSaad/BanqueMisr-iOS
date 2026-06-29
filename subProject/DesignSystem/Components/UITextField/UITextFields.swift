//
//  UITextFields.swift
//  DesignSystem
//
//  Created by ihab saad on 26/02/2026.
//

import UIKit

extension UITextField {
  
    @IBInspectable
    var localizedPlaceholder: String {
        get {
            return placeholder ?? ""
        }
        set {
            placeholder = NSLocalizedString(newValue, comment: "")
        }
    }
}

@IBDesignable
class BMTextField: UITextField {

    // MARK: - Inspectable Properties
    
    @IBInspectable var rightImage: UIImage? {
        didSet { updateView() }
    }
    
    @IBInspectable var rightPadding: CGFloat = 0 {
        didSet { updateView() }
    }
    
    @IBInspectable var color: UIColor = .lightGray {
        didSet { updateView() }
    }
    
    // MARK: - Padding Logic
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: rightPadding + (rightImage != nil ? 35 : 10)))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: rightPadding + (rightImage != nil ? 35 : 10)))
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: rightPadding + (rightImage != nil ? 35 : 10)))
    }

    // MARK: - UI Updates
    func updateView() {
        if let image = rightImage {
            rightViewMode = .always
            
            let imageView = UIImageView(frame: CGRect(x: 5, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = color
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 25 + rightPadding, height: 20))
            view.addSubview(imageView)
            
            rightView = view
            
        } else {
            rightViewMode = .never
            rightView = nil
        }
        
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: color])
    }
}


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
