//
//  AboutUsView.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 30/06/24.
//

import UIKit

class AboutUsView: UIView {
    
    private lazy var catDogImageView: UIImageView = {
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
    
    private var hasAnimated = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        animateElements()
        configureCardView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("(init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .blueColor
        
        addSubview(catDogImageView)
        NSLayoutConstraint.activate([
            catDogImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 30),
            catDogImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            catDogImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.2),
            catDogImageView.heightAnchor.constraint(equalTo: catDogImageView.widthAnchor)
        ])
        
        addSubview(cardView)
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: catDogImageView.bottomAnchor, constant: -80),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureCardView() {
        cardView.configure(withTitle:"Sobre nós !", image: UIImage(named: "bone-icon"))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard !hasAnimated else { return }
        hasAnimated = true
        
        DispatchQueue.main.async {
            self.animateElements()
        }
    }
    
    public func animateElements() {
        catDogImageView.transform = CGAffineTransform(translationX: 0, y: -bounds.height)
        cardView.transform = CGAffineTransform(translationX: 0, y: bounds.height)
        
        UIView.animate(withDuration: 1, delay: 0.3, options: .curveEaseOut, animations: {
            self.catDogImageView.transform = .identity
            self.cardView.transform = .identity
        }, completion: nil)
    }
}
