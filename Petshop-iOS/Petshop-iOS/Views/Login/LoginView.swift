//
//  LoginView.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 22/06/24.
//

import UIKit

class LoginView: UIView {
    private var logo = UIImageView()
    private var usernameTextField = UITextField()
    private var passwordTextField = UITextField()
    private var companyLabel = UILabel()
    private var newUserLabel = UILabel()
    
    internal var loginButton = UIButton(type: .system)
    internal var forgotPasswordLabel = UIButton(type: .system)
    internal var newUserButton = UIButton(type: .system)
    
    var onLogin: ((String, String) -> Void)?
   
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
        let emailIcon = UIImageView(image: .userIcon)
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: emailIcon.bounds.height))
        emailIcon.contentMode = .center
        emailIcon.frame = rightPaddingView.bounds
        
        let passwordIcon = UIImageView(image: .eyeIcon)
        let passwordRightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: passwordIcon.bounds.height))
        passwordIcon.contentMode = .center
        passwordIcon.frame = passwordRightPaddingView.bounds
        
        backgroundColor = .primaryBackgroundColor
        
        logo.image = .logoTransparent
        logo.contentMode = .scaleAspectFit
        
        usernameTextField.placeholder = "Email"
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.layer.cornerRadius = 8
        usernameTextField.layer.borderWidth = 1.0
        usernameTextField.layer.borderColor = UIColor.primaryBorderColor.cgColor
        usernameTextField.rightView = rightPaddingView
        usernameTextField.rightViewMode = .always
        
        passwordTextField.placeholder = "Senha"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.primaryBorderColor.cgColor
        passwordTextField.rightView = passwordRightPaddingView
        passwordTextField.rightViewMode = .always
        
        loginButton.setTitle("Entrar", for: .normal)
        loginButton.setTitleColor(.primaryTextColor, for: .normal)
        loginButton.layer.cornerRadius = 15
        loginButton.backgroundColor = .primaryButtonColor
        loginButton.titleLabel?.font = .notoSansRegular(size: 20)
        
        forgotPasswordLabel.setTitle("Esqueceu a senha?", for: .normal)
        forgotPasswordLabel.titleLabel?.font = .notoSansRegular(size: 16)
        forgotPasswordLabel.setTitleColor(.primaryButtonColor, for: .normal)
        
        newUserLabel.text = "Ainda não tem uma conta?"
        newUserLabel.font = .notoSansRegular(size: 17)
        newUserLabel.textColor = .black
  
        newUserButton.setTitle("Clique aqui", for: .normal)
        newUserButton.titleLabel?.font = .notoSansRegular(size: 17)
        newUserButton.setTitleColor(.primaryButtonColor, for: .normal)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        newUserLabel.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(logo)
        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(forgotPasswordLabel)
        addSubview(newUserLabel)
        addSubview(newUserButton)
        passwordRightPaddingView.addSubview(passwordIcon)
        rightPaddingView.addSubview(emailIcon)
        
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    @objc private func loginTapped() {
        guard let username = usernameTextField.text, let password = passwordTextField.text else { return }
        onLogin?(username, password)
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
