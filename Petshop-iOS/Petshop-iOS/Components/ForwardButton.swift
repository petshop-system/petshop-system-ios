import UIKit

final class ForwardButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        setupUI()
        configure(with: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .primaryButtonColor
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 8
        translatesAutoresizingMaskIntoConstraints = false
//        addTarget(self, action: #selector(self.ForwardButton), for: .touchUpInside)
    }
    
    private func configure(with title: String) {
        setTitle(title, for: .normal)
    }
}
