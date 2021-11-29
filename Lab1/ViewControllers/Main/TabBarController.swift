//
//  TabBar.swift
//  Lab1
//
//  Created by George Weaver on 29.11.2021.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupVCs()
    }
    
    func setupTabBar() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
    }
    
    private func setupVCs() {
        viewControllers = [
            createNavController(for: SearchViewController(), title: NSLocalizedString("Поиск", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
            createNavController(for: HomeViewController(), title: NSLocalizedString("Главный экран", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: HomeViewController(), title: NSLocalizedString("Профиль", comment: ""), image: UIImage(systemName: "person")!)
        ]
    }
    
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                    title: String,
                                                    image: UIImage) -> UIViewController {
          let navController = UINavigationController(rootViewController: rootViewController)
          navController.tabBarItem.title = title
          navController.tabBarItem.image = image
          navController.navigationBar.prefersLargeTitles = true
          rootViewController.navigationItem.title = title
          return navController
      }
}
