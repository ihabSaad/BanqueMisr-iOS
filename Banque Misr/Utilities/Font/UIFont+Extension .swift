
//  UIFont+Extension .swift
//  Banque Misr
//  Created by ihab saad on 07/01/2026.

import UIKit
import MOLH

enum AppFontWeight: String {
    case regular = "Regular"
    case light = "Light"
    case medium = "Medium"
    case bold = "Bold"
    case semiBold = "SemiBold"

    
}
enum AppFontEnglish: String {
    case regular = "Cairo-Regular"
    case light = "Cairo-Light"
    case medium = "Cairo-Medium"
    case bold = "Cairo-Bold"
    case semiBold = "Cairo-SemiBold"
}

enum AppFontArabic: String {
    case regular = "Tajawal-Regular"
    case light = "Tajawal-Light"
    case medium = "Tajawal-Medium"
    case bold = "Tajawal-Bold"
    case semiBold = "Tajawal-SemiBold"
}

enum AppFont {
    
  static  var regular: String {
      let isEnglish: Bool =  MOLHLanguage.currentAppleLanguage() == "en"
            return isEnglish ? AppFontEnglish.regular.rawValue: AppFontArabic.regular.rawValue
        }
  static   var light: String {
      let isEnglish: Bool = MOLHLanguage.currentAppleLanguage() == "en"
        return isEnglish ? AppFontEnglish.light.rawValue: AppFontArabic.light.rawValue
    }
  static   var medium: String {
      let isEnglish: Bool = MOLHLanguage.currentAppleLanguage() == "en"
        return isEnglish ? AppFontEnglish.medium.rawValue: AppFontArabic.medium.rawValue
    }
  static   var bold: String {
      let isEnglish: Bool = MOLHLanguage.currentAppleLanguage() == "en"
        return isEnglish ? AppFontEnglish.bold.rawValue: AppFontArabic.bold.rawValue
    }
  static   var semiBold: String {
      let isEnglish: Bool = MOLHLanguage.currentAppleLanguage() == "en"
        return isEnglish ? AppFontEnglish.semiBold.rawValue: AppFontArabic.semiBold.rawValue
    }
}

extension UIFontDescriptor.AttributeName {
    static let nsct = UIFontDescriptor.AttributeName(
        rawValue: "NSCTFontUIUsageAttribute"
    )
}

extension UIFont {
    
    func setCustomFont(_ systemFont: String) -> String {
        var fontName = systemFont.lowercased()
        if fontName.contains(AppFontWeight.light.rawValue.lowercased()){
            return AppFont.light
        }else if fontName.contains(AppFontWeight.regular.rawValue.lowercased()) {
            return AppFont.regular
        } else if fontName.contains(AppFontWeight.medium.rawValue.lowercased()) {
            return AppFont.medium
        } else if fontName.contains(AppFontWeight.bold.rawValue.lowercased()) {
            return  AppFont.bold
        }else if fontName.contains(AppFontWeight.semiBold.rawValue.lowercased()) {
            return AppFont.semiBold
        } else {
            return AppFont.regular
        }
    }
    
    
    @objc convenience init?(myCoder aDecoder: NSCoder) {
        guard let fontDec = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,let  attribute = fontDec.fontAttributes[.nsct] as? String else {
            self.init(coder: aDecoder)!
            return
        }
        
        var customFontName = ""
        
        let fontName = attribute.lowercased()
        if fontName.contains(AppFontWeight.light.rawValue.lowercased()){
            customFontName =  AppFont.light
        }else if fontName.contains(AppFontWeight.regular.rawValue.lowercased()) {
            customFontName =  AppFont.regular
        } else if fontName.contains(AppFontWeight.medium.rawValue.lowercased()) {
            customFontName =  AppFont.medium
        } else if fontName.contains(AppFontWeight.bold.rawValue.lowercased()) {
            customFontName =   AppFont.bold
        }else if fontName.contains(AppFontWeight.semiBold.rawValue.lowercased()) {
            customFontName =  AppFont.semiBold
        } else {
            customFontName =  AppFont.regular
        }
        self.init(name: customFontName, size: fontDec.pointSize)
    }
    
    static func fontSwizzling() {
        if let nativeInit = class_getClassMethod(self, #selector(UIFontDescriptor.init(coder:))), let myInit = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))){
            method_exchangeImplementations(nativeInit, myInit)
        }
        
    }
}


