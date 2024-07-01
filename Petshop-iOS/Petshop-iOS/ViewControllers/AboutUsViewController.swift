//
//  AboutUsViewController.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 30/06/24.
//

import UIKit

class AboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let aboutUsView = AboutUsView(frame: view.bounds)
        aboutUsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutUsView)
        
        NSLayoutConstraint.activate([
            aboutUsView.topAnchor.constraint(equalTo: view.topAnchor),
            aboutUsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            aboutUsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            aboutUsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
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
