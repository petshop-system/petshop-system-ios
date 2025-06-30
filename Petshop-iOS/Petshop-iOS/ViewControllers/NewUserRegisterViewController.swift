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
        print("navigationController: \(navigationController != nil)")
        view = newUserRegisterView
    }
}
