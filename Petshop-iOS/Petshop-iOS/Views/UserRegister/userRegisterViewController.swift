//
//  userRegisterViewController.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 14/07/24.
//

import UIKit

class userRegisterViewController: UIViewController {
    let userRegister = UserRegisterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userRegister)
        
        userRegister.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userRegister.topAnchor.constraint(equalTo: view.topAnchor),
            userRegister.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userRegister.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userRegister.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        setupBackButton()
    }
    
    private func setupBackButton() {
        let backButton = UIBarButtonItem.backButton(color: .secondaryTextColor, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
        print("usuário voltou pra view anterior")
    }
}
