//
//  LoginViewController.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 29/05/24.
//

import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    private let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        
        loginView.viewModel = viewModel
        
        viewModel.createAccount = {[weak self] in
            self?.createAccount()
    }
        
        loginView.onLogin = { [weak self] username, password in
            self?.viewModel.authenticateUser(username: username, password: password) { result in
                switch result {
                    case .success(let user):
                        print("Login bem-sucedido: \(user)")
                    case .failure(let error):
                        print("Erro ao fazer login: \(error.localizedDescription)")
                }
            }
        }
        
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
        let aboutUsVC = AboutUsViewController()
        navigationController?.pushViewController(aboutUsVC, animated: true)
        print("aqui o user clicou pra criar uma conta nova")
    }
    
    @objc func forgotPasswordTapped() {
        print("aqui o user vai para a view de recuperacao de conta")
    }
}
