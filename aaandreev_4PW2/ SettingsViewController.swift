//
//   SettingsViewController.swift
//  aaandreev_4PW2
//
//  Created by  Антон Андреев on 24.09.2021.
//

import UIKit

final class SettingsViewController: UIViewController {
    private let settingsView = UIView()
    private let locationToggle = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSettingsView()
        setupLocationToggle()
        setupCloseButton()
    }
    
    
    private func setupSettingsView(){
        settingsView.backgroundColor = UIColorFromHex(rgbValue: 0xe0ffff)
        view.addSubview(settingsView)
        settingsView.layer.cornerRadius = 15
        settingsView.translatesAutoresizingMaskIntoConstraints = false
        settingsView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 10
        ).isActive = true
        settingsView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -10
        ).isActive = true
        settingsView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        settingsView.widthAnchor.constraint(equalToConstant:  200).isActive = true
    }
    
    private func setupLocationToggle() {
        settingsView.addSubview(locationToggle)
        locationToggle.translatesAutoresizingMaskIntoConstraints = false
            locationToggle.topAnchor.constraint(
            equalTo: settingsView.topAnchor,
            constant: 50
        ).isActive = true
            locationToggle.trailingAnchor.constraint(
            equalTo: settingsView.trailingAnchor,
            constant: -10
        ).isActive = true
        locationToggle.addTarget(
            self,
            action: #selector(ViewController.locationToggleSwitched),
            for: .valueChanged
        )
    }
    
    private func setupCloseButton() {
        let button = UIButton(type: .close)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: -10
        ).isActive = true
        button.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 10
        ).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(
            equalTo: button.heightAnchor
        ).isActive = true
        button.addTarget(
            self,
            action: #selector(closeScreen),
            for: .touchUpInside
        )
    }
    
    @objc
    private func closeScreen() {
        dismiss(animated: true, completion: nil)
    }
    
    func UIColorFromHex(rgbValue:UInt32,_ alpha:Double=1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0

        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}
