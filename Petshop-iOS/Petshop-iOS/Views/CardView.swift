//
//  CardView.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 30/06/24.
//

import UIKit

class CardView: UIView {
    private let cardImageContainer = UIView()
    private let cardImage = UIImageView()
    private let cardTitle = UILabel()
    private let cardDescription = UILabel()
    private let forwardButton = UIButton(type: .roundedRect)
    private let forwardButtonIcon = UIImageView()
    
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
    
    public var descriptionText: String = "" {
        didSet {
            cardDescription.text = descriptionText
        }
    }
    
    public var button: UIButton {
        return forwardButton
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupPanGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("(init(coder:) has not been implemented")
    }
    
    func configure(withTitle title: String, description: NSAttributedString, image: UIImage?, button: UIButton?) {
            cardImage.image = image
            cardTitle.text = title
            cardDescription.attributedText = description
        
        if let button = button {
                forwardButton.setTitle(button.title(for: .normal), for: .normal)
                forwardButton.backgroundColor = button.backgroundColor
                forwardButton.setTitleColor(button.titleColor(for: .normal), for: .normal)
                forwardButton.layer.cornerRadius = button.layer.cornerRadius
        }
    }
        
        private func setupUI() {
            backgroundColor = .whiteColor
            layer.cornerRadius = 12
            
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
            cardTitle.font = UIFont.boldSystemFont(ofSize: 24)
            cardTitle.textColor = .BlackColor
            cardTitle.translatesAutoresizingMaskIntoConstraints = false
            addSubview(cardTitle)
            
            cardDescription.textAlignment = .center
            cardDescription.font = UIFont.systemFont(ofSize: 16)
            cardDescription.textColor = .GreyColor
            cardDescription.numberOfLines = 0
            cardDescription.translatesAutoresizingMaskIntoConstraints = false
            addSubview(cardDescription)
            
            forwardButton.setTitle("", for: .normal)
            forwardButton.setTitleColor(.whiteColor, for: .normal)
            forwardButton.translatesAutoresizingMaskIntoConstraints = false
            addSubview(forwardButton)
            
            forwardButtonIcon.image = UIImage(named: "arrow-icon")
            forwardButtonIcon.contentMode = .scaleAspectFit
            forwardButtonIcon.translatesAutoresizingMaskIntoConstraints = false
            addSubview(forwardButtonIcon)
            
            NSLayoutConstraint.activate([
                cardImageContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
                cardImageContainer.widthAnchor.constraint(equalToConstant: 80),
                cardImageContainer.heightAnchor.constraint(equalTo: cardImageContainer.widthAnchor),
                cardImageContainer.topAnchor.constraint(equalTo: topAnchor, constant: -60),
                
                cardImage.centerXAnchor.constraint(equalTo: cardImageContainer.centerXAnchor),
                cardImage.centerYAnchor.constraint(equalTo: cardImageContainer.centerYAnchor),
                cardImage.widthAnchor.constraint(equalTo: cardImageContainer.widthAnchor, multiplier: 0.4),
                cardImage.heightAnchor.constraint(equalTo: cardImage.widthAnchor),
                
                cardTitle.topAnchor.constraint(equalTo: topAnchor, constant: 35),
                cardTitle.widthAnchor.constraint(equalToConstant: 327),
                cardTitle.heightAnchor.constraint(equalToConstant: 34),
                cardTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                cardDescription.topAnchor.constraint(equalTo: cardTitle.bottomAnchor, constant: 30),
                cardDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                cardDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                
                forwardButton.widthAnchor.constraint(equalToConstant: 150),
                forwardButton.heightAnchor.constraint(equalToConstant: 38),
                forwardButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 220),
                forwardButton.topAnchor.constraint(equalTo: topAnchor, constant: 250),

                forwardButtonIcon.centerYAnchor.constraint(equalTo: forwardButton.centerYAnchor),
                forwardButtonIcon.leadingAnchor.constraint(equalTo: forwardButton.trailingAnchor, constant: -30),
                forwardButtonIcon.widthAnchor.constraint(equalToConstant: 18),
                forwardButtonIcon.heightAnchor.constraint(equalToConstant: 18)
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
                
                UIView.animate(withDuration: 0.5) {
                    self.center = self.originalCenter
                }
                
            default:
                break
            }
        }
    }
