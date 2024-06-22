//
//  CreateAccountView.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 22/06/24.
//

import UIKit

class CreateAccountView: UIView {
    let personalDataLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        personalDataLabel.text = "Dados Pessoais"
        personalDataLabel.textColor = UIColor(hex: "#blue")
        personalDataLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(personalDataLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            personalDataLabel.widthAnchor.constraint(equalToConstant: 250),
            personalDataLabel.heightAnchor.constraint(equalToConstant: 270),
            personalDataLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            personalDataLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
        ])
    }
}
