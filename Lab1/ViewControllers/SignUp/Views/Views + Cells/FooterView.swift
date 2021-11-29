//
//  FooterView.swift
//  Lab1
//
//  Created by George Weaver on 28.11.2021.
//

import Foundation
import UIKit

protocol FooterViewDelegate: AnyObject {
    func buttonTapped()
}

class FooterView: UIView {
   
    var footerType: ScreenType = .signUp
    weak var delegate: FooterViewDelegate?
    
    var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Согласен с правилами"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    var customSwitch: UISwitch = {
        let customSwitch = UISwitch()
        customSwitch.isOn = false
        return customSwitch
    }()
    
    var customButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        button.tintColor = .white
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonTapped() {
        delegate?.buttonTapped()
    }
    
    private func setupSignUp() {
        customButton.setTitle("Зарегистрироваться", for: .normal)
        
        addSubview(infoLabel)
        addSubview(customSwitch)
        addSubview(customButton)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        customSwitch.translatesAutoresizingMaskIntoConstraints = false
        customButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customSwitch.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            customSwitch.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            customSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            infoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            infoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -65),
            infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            customButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            customButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            customButton.leadingAnchor.constraint(lessThanOrEqualTo: self.leadingAnchor, constant: 100),
            customButton.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -100),
            customButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    
    }
    
     private func setupLogin() {
        customButton.setTitle("Войти", for: .normal)
        addSubview(customButton)
        customButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            customButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -60),
            customButton.leadingAnchor.constraint(lessThanOrEqualTo: self.leadingAnchor, constant: 100),
            customButton.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -100),
            customButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func configure(_ type: ScreenType) {
        footerType = type
        if footerType == .login {
            setupLogin()
        } else {
            setupSignUp()
        }
    }
}

