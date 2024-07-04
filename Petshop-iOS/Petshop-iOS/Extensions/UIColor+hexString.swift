//
//  UIColor.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 05/06/24.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        var hexString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    static let whiteColor = UIColor(hex: "#FAFAFA")
    static let blueColor = UIColor(hex: "#42A2D9")
    static let TitleBlackColor = UIColor(hex: "#39434F")
}
