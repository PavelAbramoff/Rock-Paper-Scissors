//
//  RulesViewController.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 07.10.2023.
//

import UIKit

class RulesViewController: UIViewController {
    
    private let rulesView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Rules")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstaints()
        
    }
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(rulesView)
        
        
    }
}
    
extension RulesViewController {
    private func setConstaints() {
        NSLayoutConstraint.activate([
        
            rulesView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rulesView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rulesView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1)
            
        ])
    }
}
