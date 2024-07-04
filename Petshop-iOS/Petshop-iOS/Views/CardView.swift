//
//  CardView.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 30/06/24.
//

import UIKit

class CardView: UIView {
    let cardImageContainer = UIView()
    let cardImage = UIImageView()
    let cardTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = UIColor(hex: "#FAFAFA")
        layer.cornerRadius = 12
        
        cardImageContainer.backgroundColor = UIColor(hex: "#FAFAFA")
        cardImageContainer.layer.cornerRadius = 40
        cardImageContainer.layer.masksToBounds = true
        cardImageContainer.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cardImageContainer)
        
        cardImage.contentMode = .scaleAspectFill
        cardImage.clipsToBounds = true
        cardImage.layer.cornerRadius = 14
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        cardImageContainer.addSubview(cardImage)

        cardTitle.textAlignment = .center
        cardTitle.textColor = UIColor(hex: "#39434F")
        cardTitle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cardTitle)
        
        NSLayoutConstraint.activate([
            cardImageContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardImageContainer.widthAnchor.constraint(equalToConstant: 80),
            cardImageContainer.heightAnchor.constraint(equalTo: cardImageContainer.widthAnchor),
            cardImageContainer.topAnchor.constraint(equalTo: topAnchor, constant: -60),
            
            cardImage.centerXAnchor.constraint(equalTo: cardImageContainer.centerXAnchor),
            cardImage.centerYAnchor.constraint(equalTo: cardImageContainer.centerYAnchor),
            cardImage.widthAnchor.constraint(equalTo: cardImageContainer.widthAnchor, multiplier: 0.4),
            cardImage.heightAnchor.constraint(equalTo: cardImage.widthAnchor),
            
            cardTitle.topAnchor.constraint(equalTo: cardImageContainer.bottomAnchor, constant: 16),
            cardTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cardTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cardTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func configure(withTitle title: String, image: UIImage?) {
        cardTitle.text = title
        cardImage.image = image
    }
}
