//
//  CardView.swift
//  DesignSystem
//
//  Created by ihab saad on 23/04/2026.
//
import UIKit

@IBDesignable
public class CardView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        // تحديث أبعاد الـ Gradient والـ Shadow بدقة
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
        
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: layer.cornerRadius
        ).cgPath
    }
    
    private func setup() {
        // 🎨 لون براند بنك مصر (العنابي)
        let brand = UIColor(red: 82/255, green: 18/255, blue: 32/255, alpha: 1)
        
        // 🧱 أبيض صريح للنظافة والوضوح
        backgroundColor = .white
        layer.cornerRadius = 16 // زاوية متزنة (مش حادة ومش مدورة زيادة)
        
        // 🌈 الـ Gradient: السر في الـ "Radial-like" effect
        // هنا بنخلي اللون يظهر بس في الزاوية كأنه انعكاس ضوء
        gradientLayer.colors = [
            brand.withAlphaComponent(0.04).cgColor, // زودنا النسبة سنة عشان تبان على الشاشات المختلفة
            UIColor.white.withAlphaComponent(0).cgColor
        ]
        
        // locations: بتخلي اللون يختفي بسرعة جداً قبل ما يوصل لنص الكارت
        gradientLayer.locations = [0.0, 0.4]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.8, y: 0.8)
        
        if gradientLayer.superlayer == nil {
            layer.insertSublayer(gradientLayer, at: 0)
        }
        
        // 🌫 الـ Shadow: "الظل السحابي"
        // عشان يخدم ملايين، لازم الكارت يكون بارز بوضوح عن الخلفية
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.04
        layer.shadowOffset = CGSize(width: 0, height: 8) // ظل لتحت بيدي إيحاء بالارتفاع
        layer.shadowRadius = 15 // انتشار واسع للراحة البصرية
        
        // ✨ الـ Border: "شعرة" تحديد
        layer.borderWidth = 0.8
        layer.borderColor = UIColor.black.withAlphaComponent(0.05).cgColor
        
        layer.masksToBounds = false
    }
}
