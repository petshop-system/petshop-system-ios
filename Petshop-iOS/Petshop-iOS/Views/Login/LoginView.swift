//
//  LoginView.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 22/06/24.
//

import UIKit

class LoginView: UIView {
    private let logo = UIImageView()
    private let usernameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let companyLabel = UILabel()
    private let newUserLabel = UILabel()
    
    internal let loginButton = UIButton(type: .system)
    internal let forgotPasswordLabel = UIButton(type: .system)
    internal let newUserButton = UIButton(type: .system)
   
    func configureLoginButton(title: String, target: Any?, action: Selector, for event: UIControl.Event) {
        loginButton.setTitle(title, for: .normal)
        loginButton.addTarget(target, action: action, for: event)
    }
    
    func configureForgotPasswordLabel(text: String, target: Any?, action: Selector) {
        forgotPasswordLabel.setTitle(text, for: .normal)
        forgotPasswordLabel.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func configureNewUserLabel(text: String) {
        newUserLabel.text = text
    }
    
    func configureNewUserButton(title: String, target: Any?, action: Selector, for event: UIControl.Event) {
        newUserButton.setTitle(title, for: .normal)
        newUserButton.addTarget(target, action: action, for: event)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var viewModel: LoginViewModel? {
        didSet {
        }
    }
    
    private func setupUI() {
        backgroundColor = .primaryBackgroundColor
        logo.image = .logoTransparent
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        
        usernameTextField.placeholder = "Email"
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.layer.cornerRadius = 8
        usernameTextField.layer.borderWidth = 1.0
        usernameTextField.layer.borderColor = UIColor.lightGray.cgColor
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        let emailIcon = UIImageView(image: .userIcon)
        emailIcon.contentMode = .center
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: emailIcon.bounds.height))
        rightPaddingView.addSubview(emailIcon)
        emailIcon.frame = rightPaddingView.bounds
        usernameTextField.rightView = rightPaddingView
        usernameTextField.rightViewMode = .always
        
        passwordTextField.placeholder = "Senha"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        let passwordIcon = UIImageView(image: .eyeIcon)
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
        loginButton.backgroundColor = .primaryButtonColor
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        forgotPasswordLabel.setTitle("Esqueceu a senha?", for: .normal)
        forgotPasswordLabel.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        forgotPasswordLabel.setTitleColor(.primaryButtonColor, for: .normal)
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        newUserLabel.text = "Ainda não tem uma conta?"
        newUserLabel.font = UIFont.systemFont(ofSize: 17)
        newUserLabel.textColor = .black
        newUserLabel.translatesAutoresizingMaskIntoConstraints = false
        
        newUserButton.setTitle("Clique aqui", for: .normal)
        newUserButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        newUserButton.setTitleColor(.primaryButtonColor, for: .normal)
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
            forgotPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 110),
            
            newUserLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            newUserLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 280),
            
            newUserButton.centerYAnchor.constraint(equalTo: newUserLabel.centerYAnchor),
            newUserButton.leadingAnchor.constraint(equalTo: newUserLabel.trailingAnchor, constant: 8),
        ])
    }
}