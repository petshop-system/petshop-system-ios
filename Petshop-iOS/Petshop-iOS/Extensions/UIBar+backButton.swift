//
//  UIBar+backButton.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 30/06/24.
//

import UIKit

extension UIBarButtonItem {
    
    static func backButton(color: UIColor = .white, target: Any?, action: Selector?) -> UIBarButtonItem {
        
            let backButtonImage = UIImage(named: "back-arrow-light") ?? UIImage(named: "back-arrow-dark")
            let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: target, action: action)
            backButton.tintColor = color
        
            return backButton
    }
}
