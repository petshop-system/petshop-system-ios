//
//  LoginView.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 22/06/24.
//

import UIKit

class LoginView: UIView {
    let logo = UIImageView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton(type: .system)
    let forgotPasswordLabel = UILabel()
    let companyLabel = UILabel()
    let newUserLabel = UILabel()
    let newUserButton = UIButton()
    
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
        logo.image = UIImage(named: "logo-transparent")
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        
        usernameTextField.placeholder = "Email"
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        let emailIcon = UIImageView(image: UIImage(named: "user-icon"))
        emailIcon.contentMode = .center
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: emailIcon.bounds.height))
        rightPaddingView.addSubview(emailIcon)
        emailIcon.frame = rightPaddingView.bounds
        usernameTextField.rightView = rightPaddingView
        usernameTextField.rightViewMode = .always
        
        passwordTextField.placeholder = "Senha"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        let passwordIcon = UIImageView(image: UIImage(named: "eye-icon"))
        passwordIcon.contentMode = .center
        let passwordRightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: passwordIcon.bounds.height))
        passwordRightPaddingView.addSubview(passwordIcon)
        passwordIcon.frame = passwordRightPaddingView.bounds
        passwordTextField.rightView = passwordRightPaddingView
        passwordTextField.rightViewMode = .always
        
        loginButton.setTitle("Entrar", for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 15
        loginButton.backgroundColor = UIColor(hex: "#42A2D9")
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        forgotPasswordLabel.text = "Esqueceu a senha?"
        forgotPasswordLabel.textColor = .systemBlue
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        newUserLabel.text = "Não tem uma conta?"
        newUserLabel.textColor = .black
        newUserLabel.translatesAutoresizingMaskIntoConstraints = false
        
        newUserButton.setTitle("Clique aqui", for: .normal)
        newUserButton.setTitleColor(.systemBlue, for: .normal)
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(logo)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(forgotPasswordLabel)
        addSubview(newUserLabel)
        addSubview(newUserButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: 250),
            logo.heightAnchor.constraint(equalToConstant: 270),
            logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            
            usernameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            usernameTextField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20),
            usernameTextField.widthAnchor.constraint(equalToConstant: 327),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: usernameTextField.heightAnchor),
            
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor),
            loginButton.heightAnchor.constraint(equalTo: usernameTextField.heightAnchor),
            
            forgotPasswordLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            forgotPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 130),
            
            newUserLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            newUserLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 180),
            
            newUserButton.centerYAnchor.constraint(equalTo: newUserLabel.centerYAnchor),
            newUserButton.leadingAnchor.constraint(equalTo: newUserLabel.trailingAnchor, constant: 8),
        ])
    }
}
