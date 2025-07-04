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

    private var hasAnimated = false
    var onNextTapped: (() -> Void)?
    
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
        backgroundColor = .secondaryBackgroundColor
        
        aboutViewBackground.contentMode = .scaleAspectFill
        aboutViewBackground.clipsToBounds = true
        aboutViewBackground.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(aboutViewBackground)
        NSLayoutConstraint.activate([
            aboutViewBackground.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 30),
            aboutViewBackground.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            aboutViewBackground.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.2),
            aboutViewBackground.heightAnchor.constraint(equalTo: aboutViewBackground.widthAnchor)
        ])
        
        addSubview(cardView)
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: aboutViewBackground.bottomAnchor, constant: -80),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func configureCardView() {
        let button = UIButton(type: .system)
        button.setTitle("Próximo", for: .normal)
        button.backgroundColor = .secondaryBackgroundColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        
        let attributedDescription = NSMutableAttributedString(string: """
        O Petshop-System é a plataforma que conecta você à uma rede de diferentes serviços e produtos para o seu PET.
            
        Para continuar, realize seu cadastro.
        """)
     
            let boldFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
            
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
            button: button
        )
        
        button.addTarget(self, action: #selector(handleNextButtonTap), for: .touchUpInside)
    }
    
    @objc private func handleNextButtonTap() {
        onNextTapped?()
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
        cardView.transform = CGAffineTransform(translationX: 0, y: bounds.height)
        
        UIView.animate(withDuration: 1, delay: 0.2, options: .curveEaseOut, animations: {
            self.aboutViewBackground.transform = .identity
            self.cardView.transform = .identity
        }, completion: nil)
    }
}
