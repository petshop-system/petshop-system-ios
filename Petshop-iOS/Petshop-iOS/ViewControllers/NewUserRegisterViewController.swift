//
//  NewUserRegisterViewController.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira da Silva Nascimento on 29/06/25.
//

import UIKit

class NewUserRegisterViewController: UIViewController {
    let newUserRegisterView = NewUserRegisterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        setupTitle()
        setupBackButton()
        
        view.backgroundColor = .primaryBackgroundColor
        
        view.addSubview(newUserRegisterView)
        newUserRegisterView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newUserRegisterView.topAnchor.constraint(equalTo: view.topAnchor),
            newUserRegisterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newUserRegisterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newUserRegisterView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Cadastro de Usuário"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textColor = .primaryButtonColor
        titleLabel.textAlignment = .center
        
        navigationItem.titleView = titleLabel
    }
    
    private func setupBackButton() {
        let backButton = UIBarButtonItem.backButton(color: .secondaryBackgroundColor, target: self, action: #selector(backButtonTapped))
        
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
