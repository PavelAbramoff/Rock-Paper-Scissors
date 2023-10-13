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
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
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
        
        let userDefaults = UserDefaults.standard
        let isUserAuthorised = userDefaults.bool(forKey: "isUserAuthorised")
        
        if isUserAuthorised {
            showIfUserAuthorised()
        } else {
            showIfUserNotAuthorised()
        }
    }
    
    private func showIfUserNotAuthorised() {
        
        let loginVC = LoginVewController()
        
        setViewControllers([loginVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Login"

        items[0].image = UIImage(systemName: "person.circle.fill")

        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont(name: "Roboto-Bold", size: 14) as Any], for: .normal)
    }
    
    private func showIfUserAuthorised() {
        
        let StatVC = StatisticViewController()
        let gameVC = SetupViewController()
        let rulesVC = RulesViewController()
        
        setViewControllers([gameVC, StatVC, rulesVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Game"
        items[1].title = "Statistic"
        items[2].title = "Rules"

        items[0].image = UIImage(systemName: "gamecontroller.fill")
        items[1].image = UIImage(systemName: "trophy.fill")
        items[2].image = UIImage(systemName: "pencil.and.outline")

        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont(name: "Roboto-Bold", size: 14) as Any], for: .normal)
    }
    
}
