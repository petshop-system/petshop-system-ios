//
//  UserRegisterView.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 14/07/24.
//

import UIKit

class UserRegisterView: UIView {
    private let userRegistrationLabel = UILabel()
    private let cardRegistrationDescription = UILabel()
    private let forwardButton = UIButton.forwardButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .primaryBackgroundColor
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("(init(coder:) has not been implemented")
    }
    
    private func setupUI() {
    }
}
