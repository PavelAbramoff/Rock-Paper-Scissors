//
//  UIView + Extensions.swift
//  Rock-Paper-Scissors
//
//  Created by Pavel on 2023-09-23.
//

import UIKit

extension UIView {
    
    func addShadowOnView() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 2
    }
}
