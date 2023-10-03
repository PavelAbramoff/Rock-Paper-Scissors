//
//  SetupViewController.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 01.10.2023.
//

import UIKit

class SetupViewController: UIViewController {
    
    private let userLogoImageView: UIImageView = {
        let userImage = UIImageView()
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.image = UIImage(named: "imageLogo")
        userImage.contentMode = .scaleAspectFit
        userImage.layer.borderColor = UIColor.specialBlue.cgColor
        userImage.layer.borderWidth = 3
        userImage.contentMode = .scaleAspectFit
        return userImage
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "User Name"
        label.font = .robotoBold24()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
    
    var countRounds = 1
    
    private let actionView = ActionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
    }
    
    override func viewDidLayoutSubviews() {
        userLogoImageView.layer.cornerRadius = userLogoImageView.frame.width / 2
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(userLogoImageView)
        view.addSubview(userNameLabel)
        view.addSubview(infoImageView)
        view.addSubview(infoLabel)
        view.addSubview(oneBatleButton)
        oneBatleButton.addTarget(self, action: #selector(batleButtonTapped), for: .touchUpInside)
        view.addSubview(threeBatleButton)
        threeBatleButton.addTarget(self, action: #selector(batleButtonTapped), for: .touchUpInside)
        view.addSubview(fiveBatleButton)
        fiveBatleButton.addTarget(self, action: #selector(batleButtonTapped), for: .touchUpInside)
        view.addSubview(tenBatleButton)
        tenBatleButton.addTarget(self, action: #selector(batleButtonTapped), for: .touchUpInside)
    }
    
    @objc private func batleButtonTapped(button: MatchButton) {
        button.backgroundColor = .specialYellow
        button.tintColor = .blue
        actionView.presentView(viewController: self)
        guard let rounds = button.countRounds else { return }
        countRounds = rounds
        let delayInSeconds: TimeInterval = 4
        DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds) {
            self.actionView.removeView()
            button.backgroundColor = .specialBlue
            button.tintColor = .white
            let gameVC = ViewController()
            gameVC.modalPresentationStyle = .fullScreen
            self.present(gameVC, animated: true)
        }
        print(countRounds)
    }
}

extension SetupViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            userLogoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userLogoImageView.widthAnchor.constraint(equalToConstant: 80),
            userLogoImageView.heightAnchor.constraint(equalToConstant: 80),
            
            userNameLabel.centerYAnchor.constraint(equalTo: userLogoImageView.centerYAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: userLogoImageView.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            infoImageView.topAnchor.constraint(equalTo: userLogoImageView.bottomAnchor, constant: 20),
            infoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            infoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            infoImageView.heightAnchor.constraint(equalToConstant: 250),
            
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

