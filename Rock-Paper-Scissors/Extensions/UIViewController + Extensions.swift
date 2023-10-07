//
//  UIViewController + Extensions.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 07.10.2023.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(okButton)
        
        present(alertController, animated: true)
    }
    
    public func goToGameView() {
        let mainGameScreen = SetupViewController()
        mainGameScreen.modalPresentationStyle = .fullScreen
        present(mainGameScreen, animated: true)
    }
}
