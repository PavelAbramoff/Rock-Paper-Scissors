//
//  UIStackView + Extensions.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 25.09.2023.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView],
                     axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat,
                     distribution: Distribution) {
        self.init(arrangedSubviews:arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
