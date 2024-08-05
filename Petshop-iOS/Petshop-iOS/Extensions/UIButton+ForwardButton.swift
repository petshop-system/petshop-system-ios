//
//  ForwardButton+ButtonIcon.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 14/07/24.
//

import UIKit

extension UIButton {
    static func forwardButton() -> UIButton {
        let button = UIButton(type: .roundedRect)
        
        button.setTitle("Próximo", for: .normal)
        button.titleLabel?.font = .notoSansMedium(size: 16)
        button.backgroundColor = .primaryButtonColor
        button.layer.cornerRadius = 14
        button.setTitleColor(.primaryTextColor, for: .normal)
        
        let buttonIcon = UIImageView(image: .arrowIcon)
        buttonIcon.contentMode = .scaleAspectFit
        buttonIcon.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(buttonIcon)
        
        NSLayoutConstraint.activate([
            buttonIcon.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            buttonIcon.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: -30),
            buttonIcon.widthAnchor.constraint(equalToConstant: 18),
            buttonIcon.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        return button
    }
}
