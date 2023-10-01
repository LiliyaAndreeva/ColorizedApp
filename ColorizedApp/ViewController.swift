//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Лилия Андреева on 29.09.2023.
//

import UIKit

// MARK: - ViewContrller
class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var redsNumberLabel: UILabel!
    @IBOutlet weak var greensNumberLabel: UILabel!
    @IBOutlet weak var bluesNumberLabel: UILabel!
    @IBOutlet weak var alphasNumberLabel: UILabel!
    
    @IBOutlet weak var redsSlider: UISlider!
    @IBOutlet weak var greensSlider: UISlider!
    @IBOutlet weak var bluesSlider: UISlider!
    @IBOutlet weak var alphasSlider: UISlider!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSliders()
        mainView.layer.cornerRadius = 20
        mainView.backgroundColor = UIColor(
            red: CGFloat(redsSlider.value),
            green: CGFloat(greensSlider.value),
            blue: CGFloat(bluesSlider.value),
            alpha: CGFloat(alphasSlider.value))
    }
    
    // MARK: - IB Action
    @IBAction func forSlidersAction(_ sender: UISlider) {
        
        switch sender {
        case redsSlider:
            redsNumberLabel.text = String(format: "%.2f", redsSlider.value)
        case greensSlider:
            greensNumberLabel.text = String(format: "%.2f", greensSlider.value)
        case bluesSlider:
            bluesNumberLabel.text = String(format: "%.2f", bluesSlider.value)
        default:
            alphasNumberLabel.text = String(format: "%.2f", alphasSlider.value)
        }
        
        mainView.backgroundColor = UIColor(
            red: CGFloat(redsSlider.value),
            green: CGFloat(greensSlider.value),
            blue: CGFloat(bluesSlider.value),
            alpha: CGFloat(alphasSlider.value))
    }
}

//MARK: - Extension
extension ViewController {
    private func setupSliders() {
        [redsSlider, greensSlider, bluesSlider, alphasSlider].forEach {
            $0?.value = 0.5
            $0?.minimumValue = 0
            $0?.maximumValue = 1
        }
        redsSlider.minimumTrackTintColor = .red
        greensSlider.minimumTrackTintColor = .green
        bluesSlider.minimumTrackTintColor = .blue
        alphasSlider.minimumTrackTintColor = .gray
    }
}

