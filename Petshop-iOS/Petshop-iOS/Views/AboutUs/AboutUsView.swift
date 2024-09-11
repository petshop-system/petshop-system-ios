//
//  AboutUsView.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 30/06/24.
//

import UIKit

class AboutUsView: UIView {
    
    private lazy var aboutViewBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .catdog
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let cardView: CardView = {
        let cardView = CardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    public func setInitialCardViewPosition(height: CFloat) {
        cardView.transform = CGAffineTransform(translationX: 0, y: CGFloat(height))
    }
    
    var viewModel: AboutUsViewModel? {
        didSet {
            configureCardView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        configureCardView()
        animateElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .secondaryBackgroundColor
        
        aboutViewBackground.contentMode = .scaleAspectFill
        aboutViewBackground.clipsToBounds = true
        aboutViewBackground.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(aboutViewBackground)
        addSubview(cardView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            aboutViewBackground.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 30),
            aboutViewBackground.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            aboutViewBackground.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.2),
            aboutViewBackground.heightAnchor.constraint(equalTo: aboutViewBackground.widthAnchor),
            
            cardView.topAnchor.constraint(equalTo: aboutViewBackground.bottomAnchor, constant: -80),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func configureCardView() {
        let button = UIButton.forwardButton()
        button.addTarget(self, action: #selector(forwardButtonTapped), for: .touchUpInside)
        
        let attributedDescription = NSMutableAttributedString(string: """
         O Petshop-System é a plataforma que conecta você à uma rede de diferentes serviços e produtos para o seu PET.
             
         Para continuar, realize seu cadastro.
         """)
        
        let regularFontAttribute = [NSAttributedString.Key.font: UIFont.notoSansRegular(size: 17)]
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        
        attributedDescription
            .addAttributes(
                regularFontAttribute as [NSAttributedString.Key : Any],
                range: NSRange(
                    location: 0,
                    length: attributedDescription.length
                )
            )
        
        if let range = attributedDescription.string.range(of: "Petshop-System") {
            let nsRange = NSRange(range, in: attributedDescription.string)
            attributedDescription.addAttributes(boldFontAttribute, range: nsRange)
        }
        
        if let range = attributedDescription.string.range(of: "PET") {
            let nsRange = NSRange(range, in: attributedDescription.string)
            attributedDescription.addAttributes(boldFontAttribute, range: nsRange)
        }
        
        cardView.configure(
            withTitle: "Sobre nós !",
            description: attributedDescription,
            image: .boneIcon,
            button: button,
            buttonAction: { [weak self] in
                self?.viewModel?.forwardButtonTapped()
            }
        )
    }
    
    public func animateElements() {
        cardView.transform = CGAffineTransform(translationX: 0, y: bounds.height)
        
        UIView
            .animate(
                withDuration: 1.8,
                delay: 0.1,
                options: .curveEaseInOut,
                animations: {
                    self.aboutViewBackground.transform = .identity
                    self.cardView.transform = .identity
                }, completion: nil)
    }
    
    @objc private func forwardButtonTapped() {
        viewModel?.forwardButtonTapped()
    }
}
