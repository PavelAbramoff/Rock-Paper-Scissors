//
//  MainTabBarController.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 24.09.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialBlue
        tabBar.unselectedItemTintColor = .specialGrayText
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.specialBlue.cgColor
    }
    
    private func setupItems() {
        let mainVC = ViewController()
        let loginVC = LoginVewController()
        
        setViewControllers([loginVC, mainVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Login"
        items[1].title = "Game"

        items[0].image = UIImage(systemName: "person.circle.fill")
        items[1].image = UIImage(systemName: "gamecontroller.fill")

        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont(name: "Roboto-Bold", size: 14) as Any], for: .normal)
    }
}
