//
//  LoginViewModel.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 15/07/24.
//

import Foundation

class LoginViewModel {
    var createAccount: (() -> Void)?
    
    func authenticateUser(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        AuthService().authenticateUser(username: username, password: password, completion: completion)
    }
    
    func forwardButtonTapped() {
        createAccount?()
        print("usuario clicou para ir para a próxima view")
    }
}
