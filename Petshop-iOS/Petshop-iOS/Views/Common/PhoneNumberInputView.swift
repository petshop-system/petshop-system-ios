//
//  PhoneNumberInputView.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 02/08/24.
//

import UIKit
import CountryPickerView

class PhoneNumberTextField: UIView, CountryPickerViewDelegate {
    private let containerView = UIView()
    private let countryPickerView = CountryPickerView()
    private var textField = UITextField()
    private let padding: CGFloat = 1.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.primaryBorderColor.cgColor
        containerView.backgroundColor = .primaryBackgroundColor
        
        countryPickerView.delegate = self
        countryPickerView.showPhoneCodeInView = false
        countryPickerView.showCountryCodeInView = false
        countryPickerView.showCountryNameInView = false
        countryPickerView.layer.cornerRadius = 16

        textField.placeholder = "Insira seu número de telefone"
        textField.keyboardType = .phonePad
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        countryPickerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerView)
        addSubview(textField)
        addSubview(countryPickerView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                                  
            countryPickerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            countryPickerView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            countryPickerView.widthAnchor.constraint(equalToConstant: 30),
            
            textField.leadingAnchor.constraint(equalTo: countryPickerView.trailingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            textField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
        
        countryPickerView.layer.borderWidth = 0
    }
    
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        textField.text = country.phoneCode
    }
}
