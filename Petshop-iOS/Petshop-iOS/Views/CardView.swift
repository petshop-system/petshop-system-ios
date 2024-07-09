//
//  CardView.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 30/06/24.
//

import UIKit

class CardView: UIView {
    private let catDogImageView = UIImageView()
    private let cardImageContainer = UIView()
    private let cardImage = UIImageView()
    private let cardTitle = UILabel()
    
    private var originalCenter: CGPoint = .zero
    private var isDraggingCard: Bool = false
    
    public var title: String = "" {
        didSet {
            cardTitle.text = title
        }
    }
    
    public var imageName: String = "" {
        didSet {
            cardImage.image = UIImage(named: imageName)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupPanGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setupPanGesture()
    }
    
    func configure(withTitle title: String, image: UIImage?) {
            self.cardImage.image = image
            self.cardTitle.text = title
        }
    
    private func setupUI() {
        backgroundColor = .whiteColor
        layer.cornerRadius = 12
        
        catDogImageView.contentMode = .scaleAspectFill
        catDogImageView.clipsToBounds = true
        catDogImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(catDogImageView)
        
        cardImageContainer.backgroundColor = .whiteColor
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
        cardTitle.textColor = .TitleBlackColor
        cardTitle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cardTitle)
        
        NSLayoutConstraint.activate([
            catDogImageView.topAnchor.constraint(equalTo: topAnchor),
            catDogImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            catDogImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            catDogImageView.heightAnchor.constraint(equalToConstant: 100),
            
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
    
    private func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        addGestureRecognizer(panGesture)
    }
    
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            originalCenter = center
            isDraggingCard = true
        case .changed:
            guard isDraggingCard else { return }
            let translation = gesture.translation(in: self)
            center = CGPoint(x: originalCenter.x, y: originalCenter.y + translation.y)
        case .ended, .cancelled:
            guard isDraggingCard else { return }
            isDraggingCard = false
            UIView.animate(withDuration: 0.3) {
                self.center = self.originalCenter
            }
        default:
            break
        }
    }
}
