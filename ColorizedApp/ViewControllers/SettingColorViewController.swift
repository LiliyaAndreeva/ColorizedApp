

import UIKit

protocol SettingColorViewControllerDelegate {
    func setupColorForBackground(_ color: UIColor)
}

// MARK: - ViewContrller
final class SettingColorViewController: UIViewController {
    
    @IBOutlet weak var slidersView: UIView!
    @IBOutlet weak var redsNumberLabel: UILabel!
    @IBOutlet weak var greensNumberLabel: UILabel!
    @IBOutlet weak var bluesNumberLabel: UILabel!
    @IBOutlet weak var alphasNumberLabel: UILabel!
    
    @IBOutlet weak var redSlidersTF: UITextField!
    @IBOutlet weak var greenSlidersTF: UITextField!
    @IBOutlet weak var blueSlidersTF: UITextField!
    @IBOutlet weak var alphasSliderTF: UITextField!
    
    @IBOutlet weak var redsSlider: UISlider!
    @IBOutlet weak var greensSlider: UISlider!
    @IBOutlet weak var bluesSlider: UISlider!
    @IBOutlet weak var alphasSlider: UISlider!
    
    var color: UIColor!
    
    var delegate: SettingColorViewControllerDelegate!
 
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        slidersView.layer.cornerRadius = 20
        setupSliders()
        setupColor()
        setupTF()
        setupLabels()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        endEditing()
    }
    
    
    // MARK: - IB Action
    @IBAction func forSlidersAction(_ sender: UISlider) {
        
        switch sender {
        case redsSlider:
            redsNumberLabel.text = formatToString(from: redsSlider)
            redSlidersTF.text = formatToString(from: redsSlider)
        case greensSlider:
            greensNumberLabel.text = formatToString(from: greensSlider)
            greenSlidersTF.text = formatToString(from: greensSlider)
        case bluesSlider:
            bluesNumberLabel.text = formatToString(from: bluesSlider)
            blueSlidersTF.text = formatToString(from: bluesSlider)
        default:
            alphasNumberLabel.text = formatToString(from: alphasSlider)
            alphasSliderTF.text = formatToString(from: alphasSlider)
            
        }
        setupColor()
    }
    
    
    @IBAction func doneButtonPressed() {
        dismiss(animated: true)
        
        delegate.setupColorForBackground(UIColor(
            red: CGFloat(redsSlider.value),
            green: CGFloat(greensSlider.value),
            blue: CGFloat(bluesSlider.value),
            alpha: CGFloat(alphasSlider.value)
        ))
    }
}
    
//MARK: - Extension
extension SettingColorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let value = Float(textField.text ?? "") ?? nil , (0...1).contains(value) else {
            showAlert(
                with: "Не верный формат",
                message: "Введите число от 0 до 1"
            )
            return
        }
    }
    
    private func showAlert(with title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok ", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
    
    private func formatToString(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setupSliders() {
        
        let ciColor = CIColor(color: color)
        redsSlider.value = Float(ciColor.red)
        greensSlider.value = Float(ciColor.green)
        bluesSlider.value = Float(ciColor.blue)
        alphasSlider.value = Float(ciColor.alpha)
        
        redsSlider.minimumTrackTintColor = .red
        greensSlider.minimumTrackTintColor = .green
        bluesSlider.minimumTrackTintColor = .blue
        alphasSlider.minimumTrackTintColor = .gray
    }
    
    
    private func setupColor() {
        
        slidersView.backgroundColor = UIColor(red: CGFloat(redsSlider.value),
                                              green: CGFloat(greensSlider.value),
                                              blue: CGFloat(bluesSlider.value),
                                              alpha: CGFloat(alphasSlider.value))
    }
    
    private func setupLabels() {
        redsNumberLabel.text = formatToString(from: redsSlider)
        greensNumberLabel.text = formatToString(from: greensSlider)
        bluesNumberLabel.text = formatToString(from: bluesSlider)
        alphasNumberLabel.text = formatToString(from: alphasSlider)
    }
    
    private func setupTF() {
        redSlidersTF.delegate = self
        greenSlidersTF.delegate = self
        blueSlidersTF.delegate = self
        alphasSliderTF.delegate = self
        
        redSlidersTF.text = formatToString(from: redsSlider)
        greenSlidersTF.text = formatToString(from: greensSlider)
        blueSlidersTF.text = formatToString(from: bluesSlider)
        alphasSliderTF.text = formatToString(from: alphasSlider)
        
    }
    private func endEditing() {
        redSlidersTF.endEditing(true)
        greenSlidersTF.endEditing(true)
        blueSlidersTF.endEditing(true)
        alphasSliderTF.endEditing(true)
    }
    
}

