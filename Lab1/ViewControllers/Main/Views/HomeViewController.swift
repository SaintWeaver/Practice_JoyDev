//
//  TestViewController.swift
//  Lab1
//
//  Created by George Weaver on 27.11.2021.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        let logOutButton = UIBarButtonItem(title: "Выйти", style: .plain, target: self, action: #selector(logout))
        navigationItem.setRightBarButton(logOutButton, animated: true)
    }
    
    @objc private func logout() {
        UserDefaults.standard.removeObject(forKey: "login")
        let singupVC = SignUpViewController()
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = singupVC
    }

}
