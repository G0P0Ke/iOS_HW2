//
//  ViewController.swift
//  aaandreev_4PW2
//
//  Created by  Антон Андреев on 22.09.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    private let settingsView = UIView()
    private let settingsButton = UIButton(type: .system)
    private let locationTextView = UITextView()
    private let locationManager = CLLocationManager()
    private let locationToggle = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColorFromHex(rgbValue: 0x80ffff)
        setupLocationTextView()
        setupSettingsView()
        setupLocationToggle()
        setupSettingsButton()
        setupLocationManager()
        locationManager.requestWhenInUseAuthorization()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc
    private func settingsButtonPressed() {
        UIView.animate(
            withDuration: 0.1,
            animations: {
                self.settingsView.alpha = 1 - self.settingsView.alpha
        })
    }
    
    private func setupSettingsButton(){
        view.addSubview(settingsButton)
        settingsButton.addTarget(
            self,
            action: #selector(settingsButtonPressed),
            for: .touchUpInside
        )
        settingsButton.setImage(
            UIImage(named: "settings")?.withRenderingMode(.alwaysOriginal),
            for: .normal
        )
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 15
        ).isActive = true
        settingsButton.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -15
        ).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        settingsButton.widthAnchor.constraint(equalTo: settingsButton.heightAnchor).isActive = true
        
    }
    
    private func setupSettingsView(){
        settingsView.backgroundColor = UIColorFromHex(rgbValue: 0xe0ffff)
        view.addSubview(settingsView)
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
    
    private func setupLocationTextView() {
         view.addSubview(locationTextView)
         locationTextView.backgroundColor = .white
         locationTextView.layer.cornerRadius = 20
         locationTextView.translatesAutoresizingMaskIntoConstraints = false
         locationTextView.topAnchor.constraint(
             equalTo: view.safeAreaLayoutGuide.topAnchor,
             constant: 60
         ).isActive = true
         locationTextView.centerXAnchor.constraint(
             equalTo: view.centerXAnchor
             ).isActive = true
         locationTextView.heightAnchor.constraint(
            equalToConstant: 300
         ).isActive = true
         locationTextView.leadingAnchor.constraint(
             equalTo: view.leadingAnchor,
             constant: 15
         ).isActive = true
         locationTextView.isUserInteractionEnabled = false
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
            action: #selector(locationToggleSwitched),
            for: .valueChanged
        )
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
    
    @objc
    func locationToggleSwitched(_ sender: UISwitch) {
        if sender.isOn {
            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
                
            } else {
                sender.setOn(false, animated: true)
            }
        } else {
            locationTextView.text = ""
            locationManager.stopUpdatingLocation()
        }
    }
    
    
    func UIColorFromHex(rgbValue:UInt32,_ alpha:Double=1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0

        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        guard let coord: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        locationTextView.text = "Coordinates = \(coord.latitude) \(coord.longitude)"
    }
}

