import UIKit
import CountryKit

class CountryPickerViewController: UIViewController, CountryPickerDelegate {
    
    var countryPicker: CountryPicker!
    var delegate: CountryPickerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryPicker = CountryPicker()
        countryPicker.delegate = self
        countryPicker.showCallingCodes = true
        countryPicker.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(countryPicker)
        
        NSLayoutConstraint.activate([
            countryPicker.topAnchor.constraint(equalTo: view.topAnchor),
            countryPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            countryPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            countryPicker.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func countryPicker(_ picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        delegate?.didSelectCountry(country: Country(name: name, countryCode: countryCode, phoneCode: phoneCode, flag: flag))
        dismiss(animated: true, completion: nil)
    }
}

protocol CountryPickerViewControllerDelegate {
    func didSelectCountry(country: Country)
}

struct Country {
    let name: String
    let countryCode: String
    let phoneCode: String
    let flag: UIImage
}
