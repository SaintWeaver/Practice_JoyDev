//
//  AppDelegate.swift
//  Lab1
//
//  Created by George Weaver on 25.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        check()
        
        return true
    }
    
    func check() {
        if UserDefaults.standard.value(forKey: "login") != nil {
            window = UIWindow(frame: UIScreen.main.bounds)
            let homeVC = TabBarController()
            window?.rootViewController = homeVC
            window?.makeKeyAndVisible()
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            let signUpVC = SignUpViewController()
            window?.rootViewController = signUpVC
            window?.makeKeyAndVisible()
        }
    }
}
