//
//  SettingGameViewController.swift
//  Rock-Paper-Scissors
//
//  Created by Belov Igor on 02.10.2023.
//

import UIKit

class SettingGameViewController: UIViewController {
    
    private let infoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fon")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Number of rounds"
        label.font = .robotoMedium24()
        label.textColor = .specialGrayText
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let oneBatleButton = MatchButton(text: "1\nRound", countRounds: 1)
    private let threeBatleButton = MatchButton(text: "3\nRound", countRounds: 3)
    private let fiveBatleButton = MatchButton(text: "5\nRound", countRounds: 5)
    private let tenBatleButton = MatchButton(text: "10\nRound", countRounds: 10)
    
    private var countRounds = 1
    
    private let actionView = ActionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(infoImageView)
        view.addSubview(infoLabel)
        view.addSubview(oneBatleButton)
        oneBatleButton.addTarget(self, action: #selector(batleButtonTapped), for: .touchUpInside)
        view.addSubview(threeBatleButton)
        view.addSubview(fiveBatleButton)
        view.addSubview(tenBatleButton)
    }
    @objc private func batleButtonTapped() {
        
        switch self.countRounds {
        case 1:
            countRounds = 1
            actionView.presentView(viewController: self, numberRounds: 1)
        case 3: countRounds = 3
        case 5: countRounds = 5
        case 10: countRounds = 10
        default:
            print("!!!!")
        }
    }
}

extension SettingGameViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            infoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            infoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            infoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            infoImageView.heightAnchor.constraint(equalToConstant: 300),
            
            infoLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            oneBatleButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 30),
            oneBatleButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -15),
            oneBatleButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            oneBatleButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            
            threeBatleButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 30),
            threeBatleButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 15),
            threeBatleButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            threeBatleButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            
            fiveBatleButton.topAnchor.constraint(equalTo: oneBatleButton.bottomAnchor, constant: 30),
            fiveBatleButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -15),
            fiveBatleButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            fiveBatleButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            
            tenBatleButton.topAnchor.constraint(equalTo: oneBatleButton.bottomAnchor, constant: 30),
            tenBatleButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 15),
            tenBatleButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            tenBatleButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25)
        ])
    }
}

