//
//  AboutUsViewController.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 30/06/24.
//

import UIKit

class AboutUsViewController: UIViewController {
    private let aboutUsView = AboutUsView()
    private let viewModel = AboutUsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(aboutUsView)
        
        aboutUsView.viewModel = viewModel
        
        viewModel.navigateToUserRegister = { [weak self] in
            self?.navigateToUserRegister()
        }
        
        aboutUsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            aboutUsView.topAnchor.constraint(equalTo: view.topAnchor),
            aboutUsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            aboutUsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            aboutUsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        aboutUsView.animateElements()
        
        setupBackButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        aboutUsView.animateElements()
    }
    
    private func setupBackButton() {
        let backButton = UIBarButtonItem.backButton(color: .white, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
        print("usuário voltou pra view anterior")
    }
    
    private func navigateToUserRegister() {
        let userRegisterVC = UserRegisterViewController()
        navigationController?.pushViewController(userRegisterVC, animated: true)
        print("navegando para view de registro")
    }
}
