//
//  LoginViewController.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 29/05/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let logo = UIImageView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton(type: .system)
    let forgotPasswordLabel = UILabel()
    let companyLabel = UILabel()
    let newUserLabel = UILabel()
    let newUserButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "#E2E8F0")
        
        setupUI()
        setupConstraints()
        setupActions()
    }
    
    func setupUI() {
        logo.image = UIImage(named: "logo-transparent")
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        
        usernameTextField.placeholder = "Email"
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        let emailIcon = UIImageView(image: UIImage(named: "email-icon"))
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
        let passwordIcon = UIImageView(image: UIImage(named: "password-icon"))
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
        
        companyLabel.text = "PETSHOP SYSTEM 2024 ®"
        companyLabel.textColor = .systemBlue
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        newUserLabel.text = "Não tem uma conta?"
        newUserLabel.textColor = .black
        newUserLabel.translatesAutoresizingMaskIntoConstraints = false
        
        newUserButton.setTitle("Clique aqui", for: .normal)
        newUserButton.setTitleColor(.systemBlue, for: .normal)
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logo)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordLabel)
        view.addSubview(newUserLabel)
        view.addSubview(newUserButton)
        view.addSubview(companyLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: 250),
            logo.heightAnchor.constraint(equalToConstant: 270),
            logo.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 80 + 250/2),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20),
            usernameTextField.widthAnchor.constraint(equalToConstant: 200),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: usernameTextField.heightAnchor),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            forgotPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 130),
            
            newUserLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 180),
            newUserLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),

            newUserButton.centerYAnchor.constraint(equalTo: newUserLabel.centerYAnchor),
            newUserButton.leadingAnchor.constraint(equalTo: newUserLabel.trailingAnchor, constant: 8),
            
            companyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            companyLabel.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 350),
        ])
    }
    
    func setupActions() {
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordTapped))
        forgotPasswordLabel.isUserInteractionEnabled = true
        forgotPasswordLabel.addGestureRecognizer(tapGesture)
        
        newUserButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
    }
    
    @objc func login() {
        print("aqui o user vai fazer login no app")
    }
    
    @objc func forgotPasswordTapped() {
        print("aqui o user vai para a view de recuperacao de conta")
    }
    
    @objc func createAccount() {
        print("aqui o user vai criar uma conta")
    }
}
