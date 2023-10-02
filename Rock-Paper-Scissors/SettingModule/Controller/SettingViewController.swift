//
//  SettingViewController.swift
//  Rock-Paper-Scissors
//
//  Created by Belov Igor on 02.10.2023.
//

import UIKit

class SettingViewController: UIViewController {

    private let imageViewTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor(patternImage: UIImage(named: "sab-ziro")!)
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.specialBlue.cgColor
        return imageView
    }()
    
    private let imageViewOne: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor(patternImage: UIImage(named: "scorpion")!)
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.specialBlue.cgColor
        return imageView
    }()
    
    private let vSLabel: UILabel = {
        let label = UILabel()
        label.text = "VS"
        label.alpha = 0.0
        label.font = .robotoBold16()
        label.textAlignment = .center
        label.textColor = .specialGrayText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let vsView: UIView = {
      let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.0
        view.frame.size = CGSize(width: 50, height: 50)
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor.specialBlue.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    private let oneBatleButton = MatchButton(text: "1\nRound")
    private let threeBatleButton = MatchButton(text: "3\nRound")
    private let fiveBatleButton = MatchButton(text: "5\nRound")
    private let tenBatleButton = MatchButton(text: "10\nRound")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animation()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(infoLabel)
        view.addSubview(oneBatleButton)
        view.addSubview(threeBatleButton)
        view.addSubview(fiveBatleButton)
        view.addSubview(tenBatleButton)
    }
    
    private func configure() {
        imageViewOne.layer.cornerRadius = imageViewOne.bounds.height / 2
        imageViewOne.layer.masksToBounds = true
        imageViewTwo.layer.cornerRadius = imageViewTwo.bounds.height / 2
        imageViewTwo.layer.masksToBounds = true
    }
    
    private func animation() {
        let initialFrameOne = CGRect(x: -view.frame.size.width,
                                     y: 200,
                                     width: view.bounds.width * 0.7,
                                     height: view.bounds.width * 0.7 * 0.3)
        imageViewOne.frame = initialFrameOne
        
        let finalFrameOne = CGRect(x: view.bounds.width * 0.3 / 2,
                                   y: 200, width: view.bounds.width * 0.7,
                                   height: view.bounds.width * 0.7 * 0.3)
        
        let initialFrameTwo = CGRect(x: view.frame.size.width,
                                     y: imageViewOne.frame.origin.y + imageViewOne.frame.height + 6,
                                     width: view.bounds.width * 0.7,
                                     height: view.bounds.width * 0.7 * 0.3)
        imageViewTwo.frame = initialFrameTwo
        
        let finalFrameTwo = CGRect(x: view.bounds.width * 0.3 / 2, y: imageViewOne.frame.origin.y + imageViewOne.frame.height + 5, width: view.bounds.width * 0.7, height: view.bounds.width * 0.7 * 0.3)
        
        view.addSubview(imageViewOne)
        UIView.animate(withDuration: 2) {
            self.imageViewOne.frame = finalFrameOne
        }
        
        view.addSubview(imageViewTwo)
        UIView.animate(withDuration: 2) {
            self.imageViewTwo.frame = finalFrameTwo
        }

        let initialFrameVS = CGRect(x: view.bounds.size.width / 2 - vsView.bounds.size.height / 2,
                                    y: imageViewTwo.frame.origin.y - 3 - vsView.bounds.size.height / 2,
                                    width: self.vsView.bounds.width,
                                     height: self.vsView.bounds.width)
        
        vsView.frame = initialFrameVS
    
        view.addSubview(vsView)
        view.addSubview(vSLabel)
        NSLayoutConstraint.activate([
            vSLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vSLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 275)
        ])
        UIView.animate(withDuration: 2) {
            self.vsView.alpha = 1.0
            self.vSLabel.alpha = 1.0
        }
    }
}

extension SettingViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
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

