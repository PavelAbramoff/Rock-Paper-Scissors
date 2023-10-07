//
//  CustomGreenButton.swift
//  MyFirstApp_31.08.23
//
//  Created by Anton Morenko on 17.09.2023.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String, color: UIColor, textColor: UIColor) {
        self.init(type: .system)
        setTitle(text, for: .normal)
        backgroundColor = color
        tintColor = textColor
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        titleLabel?.font = .robotoBold16()
        translatesAutoresizingMaskIntoConstraints = false
    }
}
