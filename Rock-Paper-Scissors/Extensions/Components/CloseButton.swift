//
//  CloseButton.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 07.10.2023.
//

import UIKit

class CloseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setBackgroundImage(UIImage(systemName: "xmark.circle"), for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = .specialLightMidnightBlue
    }
}
