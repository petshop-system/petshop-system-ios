//
//  CountryManager.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 02/08/24.
//

import Foundation

class CountryManager {
    func loadCountries() -> [Country]? {
        guard let url = Bundle.main.url(forResource: "countries", withExtension: "json") else {
            print("Arquivo countries.json não encontrado.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let countries = try decoder.decode([Country].self, from: data)
            return countries
        } catch {
            print("Erro ao decodificar o JSON: \(error)")
            return nil
        }
    }
}
