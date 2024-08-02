//
//  CountryCodeModel.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 02/08/24.
//

import Foundation

struct Country: Codable {
    let name: String
    let dial_code: String
    let emoji: String
    let code: String?
}
