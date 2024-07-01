//
//  CardView.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 30/06/24.
//

import UIKit

class CardView: UIView {
    let cardImage = UIImageView()
    let cardTitle = UILabel()
    let cardDescription = UILabel()
    let forwardButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = UIColor(hex: "#FAFAFA")
        layer.cornerRadius = 12
        
        addSubview(cardImage)
        addSubview(cardTitle)
        
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cardImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            cardImage.heightAnchor.constraint(equalTo: cardImage.widthAnchor),
            
            cardTitle.topAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: 16),
            cardTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cardTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cardTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func configure(withTitle title: String, image: UIImage?) {
        cardImage.image = image
        cardTitle.text = title
    }
}
