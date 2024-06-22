//
//  LoginViewController.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 29/05/24.
//

import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "#E2E8F0")
        
        view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        loginView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordTapped))
        loginView.forgotPasswordLabel.isUserInteractionEnabled = true
        loginView.forgotPasswordLabel.addGestureRecognizer(tapGesture)
        
        loginView.newUserButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
    }
    
    @objc func login() {
        print("aqui o user vai fazer login no app")
    }
    
    @objc func createAccount() {
        print("aqui o user vai criar uma conta")
    }
    
    @objc func forgotPasswordTapped() {
        print("aqui o user vai para a view de recuperacao de conta")
    }
}
