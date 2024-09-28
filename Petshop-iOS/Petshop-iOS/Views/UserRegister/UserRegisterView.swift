//
//  UserRegisterView.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 14/07/24.
//

import UIKit

class UserRegisterView: UIView {
    private var userRegistrationLabel = UILabel()
    private var userRegistrationDescription = UILabel()
    private var cellphoneLabel = UILabel()
    private let phoneNumberInputView = PhoneNumberTextField()
    private var forwardButton = UIButton.forwardButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .primaryBackgroundColor
        
        userRegistrationLabel.text = "Cadastro de Usuário"
        userRegistrationLabel.textColor = .thirdTextColor
        userRegistrationLabel.font = .catamaranMedium(size: 16)
        userRegistrationLabel.textAlignment = .center
        
        userRegistrationDescription.text = """
        Para garantir a segurança da sua conta, acabamos de enviar um PIN por SMS.
        
        Esta etapa é necessária para validar e liberar o acesso aos nossos serviços.
        """
    
        userRegistrationDescription.textAlignment = .center
        userRegistrationDescription.font = .notoSansMedium(size: 16)
        userRegistrationDescription.textColor = .secondaryTextColor
        userRegistrationDescription.numberOfLines = 0
        
        cellphoneLabel.text = "Número de Telefone"
        cellphoneLabel.font = .catamaranBold(size: 26)
        cellphoneLabel.textColor = .thirdTextColor
        cellphoneLabel.textAlignment = .center
        
        userRegistrationLabel.translatesAutoresizingMaskIntoConstraints = false
        userRegistrationDescription.translatesAutoresizingMaskIntoConstraints = false
        cellphoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberInputView.translatesAutoresizingMaskIntoConstraints = false
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(userRegistrationLabel)
        addSubview(userRegistrationDescription)
        addSubview(cellphoneLabel)
        addSubview(phoneNumberInputView)
        addSubview(forwardButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userRegistrationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -35),
            userRegistrationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            cellphoneLabel.topAnchor.constraint(equalTo: topAnchor, constant: 180),
            cellphoneLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            phoneNumberInputView.centerXAnchor
                .constraint(equalTo: self.centerXAnchor),
            phoneNumberInputView.topAnchor.constraint(equalTo: cellphoneLabel.bottomAnchor, constant: 110),
            phoneNumberInputView.widthAnchor.constraint(equalToConstant: 250),
            phoneNumberInputView.heightAnchor.constraint(equalToConstant: 40),
    
            userRegistrationDescription.topAnchor.constraint(equalTo: userRegistrationLabel.bottomAnchor, constant: 400 ),
            userRegistrationDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userRegistrationDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            forwardButton.widthAnchor.constraint(equalToConstant: 150),
            forwardButton.heightAnchor.constraint(equalToConstant: 38),
            forwardButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 220),
            forwardButton.topAnchor.constraint(equalTo: topAnchor, constant: 730),
        ])
    }
}
