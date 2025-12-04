import UIKit

class NewUserRegisterView: UIView {
    let registerView = UIView()
    let cellphoneInputView = UIView()
    let advanceButton = ForwardButton(title: "Continuar")
    
    override init(frame: CGRect){
        super .init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder Decoder: NSCoder) {
        fatalError("(init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        backgroundColor = .primaryBackgroundColor
        
        registerView.backgroundColor = .lightGray
        registerView.translatesAutoresizingMaskIntoConstraints = false
        
        cellphoneInputView.backgroundColor = .gray
        cellphoneInputView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(registerView)
        addSubview(cellphoneInputView)
        addSubview(advanceButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            registerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            registerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            registerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            registerView.heightAnchor.constraint(equalToConstant: 100),
            
            cellphoneInputView.topAnchor.constraint(equalTo: registerView.bottomAnchor, constant: 20),
            cellphoneInputView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cellphoneInputView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cellphoneInputView.heightAnchor.constraint(equalToConstant: 50),
            
            advanceButton.topAnchor.constraint(equalTo: cellphoneInputView.bottomAnchor, constant: 40),
            advanceButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            advanceButton.widthAnchor.constraint(equalToConstant: 200),
            advanceButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func advanceButtonTapped(){
        
    }

}
