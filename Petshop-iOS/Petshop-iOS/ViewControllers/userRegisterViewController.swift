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
        
        setupBackButton()
    }
    
    private func setupBackButton() {
        let backButton = UIBarButtonItem.backButton(color: .white, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
