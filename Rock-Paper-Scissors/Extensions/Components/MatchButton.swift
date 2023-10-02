///
//  MatchButton.swift
//  Rock-Paper-Scissors
//
//  Created by Belov Igor on 25.09.2023.
//

import UIKit

class MatchButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: 50, height: 50)))
    }
    
    convenience init(text: String) {
        self.init(type: .system)
        self.setTitle(text, for: .normal)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .specialBlue
        layer.cornerRadius = 30
        tintColor = .white
        titleLabel?.font = .robotoBold24()
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        addShadowOnView()
    }
}
