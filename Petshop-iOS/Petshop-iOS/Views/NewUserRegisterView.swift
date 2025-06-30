import UIKit

class NewUserRegisterView: UIView {
    let title = UILabel()
    let registerView = UIView()
    let cellphoneInputView = UIView()
    let advanceButton = UIButton()
    
    override init(frame: CGRect){
        super .init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("(init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        backgroundColor = .systemBackground
        
        title.text = "Cadastro de Usuário"
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.textColor = .label
        
        registerView.backgroundColor = .lightGray
        registerView.translatesAutoresizingMaskIntoConstraints = false
        
        cellphoneInputView.backgroundColor = .gray
        cellphoneInputView.translatesAutoresizingMaskIntoConstraints = false
        
        advanceButton.setTitle("Avançar", for: .normal)
        advanceButton.backgroundColor = .systemBlue
        advanceButton.setTitleColor(.white, for: .normal)
        advanceButton.layer.cornerRadius = 8
        advanceButton.translatesAutoresizingMaskIntoConstraints = false
        advanceButton.addTarget(self, action: #selector(advanceButtonTapped), for: .touchUpInside)
        
        addSubview(title)
        addSubview(registerView)
        addSubview(cellphoneInputView)
        addSubview(advanceButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            registerView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 40),
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
