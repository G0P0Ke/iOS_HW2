//
//  SettingsViewController.swift
//  aaandreev_4PW2
//
//  Created by  Антон Андреев on 24.09.2021.
//

import UIKit

final class SettingsViewController: UIViewController {
    private let settingsView = UIView()
    private let locationToggle = UISwitch()
    weak var delegate: ViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColorFromHex(rgbValue: 0x80ffff)
        self.title = "Settings"
        setupSettingsView()
        setupLocationToggle()
        setupLocationManager()
    }
    
    
    
    private func setupSettingsView(){
        settingsView.backgroundColor = UIColorFromHex(rgbValue: 0xe0ffff)
        view.addSubview(settingsView)
        settingsView.layer.cornerRadius = 15
        settingsView.translatesAutoresizingMaskIntoConstraints = false
        settingsView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 60
        ).isActive = true
        settingsView.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
            ).isActive = true
        settingsView.heightAnchor.constraint(
           equalToConstant: 300
        ).isActive = true
        settingsView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: 15
        ).isActive = true
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
//        locationToggle.addTarget(
//            self,
//            action: #selector(delegate?.locationToggleSwitched),
//            for: .valueChanged
//        )
        // При переключении вылетает exception...
    }
    
    
    private func setupLocationManager(){
        let locationLabel = UILabel()
        settingsView.addSubview(locationLabel)
        locationLabel.text = "Location"
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.topAnchor.constraint(
            equalTo: settingsView.topAnchor,
            constant: 55
        ).isActive = true
        locationLabel.leadingAnchor.constraint(
            equalTo: settingsView.leadingAnchor,
            constant: 10
        ).isActive = true
        locationLabel.trailingAnchor.constraint(
            equalTo: locationToggle.leadingAnchor,
            constant: -10
        ).isActive = true
    }
    
    
    func UIColorFromHex(rgbValue:UInt32,_ alpha:Double=1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0

        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}
