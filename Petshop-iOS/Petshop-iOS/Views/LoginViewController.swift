//
//  LoginViewController.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 29/05/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo-transparent")
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Entrar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(hex: "#42A2D9")
        button.addTarget(LoginViewController.self, action: #selector(login), for: .touchUpInside)
        return button
    }()
    
    @objc let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Esqueceu a senha?"
        label.textColor = UIColor.systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.text = "PETSHOP SYSTEM 2024 ®"
        label.textColor = UIColor.systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newUserLabel: UILabel = {
        let label = UILabel()
        label.text = "Não tem uma conta?"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newUserButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Clique aqui", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(LoginViewController.self, action: #selector(createAccount), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "#E2E8F0")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordTapped))
        forgotPasswordLabel.isUserInteractionEnabled = true
        forgotPasswordLabel.addGestureRecognizer(tapGesture)
        
        let emailIcon = UIImageView(image: UIImage(named: "email-icon"))
        emailIcon.contentMode = .center

        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: emailIcon.bounds.height))

        usernameTextField.rightView = rightPaddingView
        usernameTextField.rightViewMode = .always
        rightPaddingView.addSubview(emailIcon)
        emailIcon.frame = rightPaddingView.bounds
        
        let passwordIcon = UIImageView(image: UIImage(named: "password-icon"))
        passwordIcon.contentMode = .center

        let passwordRightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: passwordIcon.bounds.height))

        passwordTextField.rightView = passwordRightPaddingView
        passwordTextField.rightViewMode = .always

        passwordRightPaddingView.addSubview(passwordIcon)
        passwordIcon.frame = passwordRightPaddingView.bounds

        view.addSubview(logo)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordLabel)
        view.addSubview(newUserLabel)
        view.addSubview(newUserButton)
        view.addSubview(companyLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        logo.translatesAutoresizingMaskIntoConstraints = false

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
