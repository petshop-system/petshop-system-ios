//
//  AboutUsViewModel.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 15/07/24.
//

import Foundation

class AboutUsViewModel {
    var navigateToUserRegister: (() -> Void)?
    
    func forwardButtonTapped() {
        navigateToUserRegister?()
        print("usuario clicou para ir para a próxima view")
    }
}
