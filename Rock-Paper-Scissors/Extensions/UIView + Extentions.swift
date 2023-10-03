//
//  UIView + Extensions.swift
//  Rock-Paper-Scissors
//
//  Created by Belov Igor on 25.09.2023.
//

import UIKit

extension UIView {
    
    func addShadowOnView() {
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 2
    }
}
