//
//  AboutUsView.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 30/06/24.
//

import UIKit

class AboutUsView: UIView {
    
    let catDogImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "catdog")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let cardView: CardView = {
        let cardView = CardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = UIColor(hex: "42A2D9")
        
        addSubview(catDogImageView)
        NSLayoutConstraint.activate([
            catDogImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            catDogImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            catDogImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.2),
            catDogImageView.heightAnchor.constraint(equalTo: catDogImageView.widthAnchor)
        ])
        
        addSubview(cardView)
                NSLayoutConstraint.activate([
                    cardView.topAnchor.constraint(equalTo: catDogImageView.bottomAnchor, constant: -98),
                    cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
                    cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
                    cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
                ])
                
                cardView.configure(withTitle: "Sobre Nós!", image: UIImage(named: "bone-icon"))
    }
}