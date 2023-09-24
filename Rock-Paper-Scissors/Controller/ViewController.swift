//
//  ViewController.swift
//  Rock-Paper-Scissors
//
//  Created by Pavel on 2023-09-23.
//

import UIKit

class ViewController: UIViewController {
    
    private let rotationView: UIView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1)
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLayoutSubviews() {
        rotationView.layer.cornerRadius = rotationView.frame.width / 2
    }
    
    private lazy var buttonPaper: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.backgroundColor = .lightGray
        button.setImage(UIImage(systemName: "hand.raised.app.fill"), for: .normal)
        //button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(playButtonPapped), for: .touchUpInside)
        button.addShadowOnView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonRock: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.backgroundColor = .lightGray
        button.setImage(UIImage(systemName: "moonphase.new.moon.inverse"), for: .normal)
        //button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(playButtonPapped), for: .touchUpInside)
        button.addShadowOnView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonScissors: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.backgroundColor = .lightGray
        button.setImage(UIImage(systemName: "scissors"), for: .normal)
        //button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(playButtonPapped), for: .touchUpInside)
        button.addShadowOnView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let markRock: UIView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.image = UIImage(named: "rock")
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let markPaper: UIView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.image = UIImage(named: "paper")
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let markScissors: UIView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.image = UIImage(named: "scissors")
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(rotationView)
        view.addSubview(buttonRock)
        view.addSubview(buttonScissors)
        view.addSubview(buttonPaper)
        view.addSubview(markRock)
        view.addSubview(markPaper)
        view.addSubview(markScissors)
    }
    
    @objc private func playButtonPapped() {
        print("tap")
    }
}

extension ViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            rotationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            rotationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rotationView.heightAnchor.constraint(equalToConstant: 300),
            rotationView.widthAnchor.constraint(equalToConstant: 300),
            
            buttonRock.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            buttonRock.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonRock.heightAnchor.constraint(equalToConstant: 80),
            buttonRock.widthAnchor.constraint(equalToConstant: 80),
            
            buttonScissors.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            buttonScissors.trailingAnchor.constraint(equalTo: buttonRock.leadingAnchor, constant: -20),
            buttonScissors.heightAnchor.constraint(equalToConstant: 80),
            buttonScissors.widthAnchor.constraint(equalToConstant: 80),
            
            buttonPaper.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            buttonPaper.leadingAnchor.constraint(equalTo: buttonRock.trailingAnchor, constant: 20),
            buttonPaper.heightAnchor.constraint(equalToConstant: 80),
            buttonPaper.widthAnchor.constraint(equalToConstant: 80),
            
            markRock.topAnchor.constraint(equalTo: rotationView.topAnchor, constant: -30),
            markRock.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            markRock.heightAnchor.constraint(equalToConstant: 80),
            markRock.widthAnchor.constraint(equalToConstant: 80),
            
            markPaper.topAnchor.constraint(equalTo: markRock.bottomAnchor, constant: 110),
            markPaper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            markPaper.heightAnchor.constraint(equalToConstant: 80),
            markPaper.widthAnchor.constraint(equalToConstant: 80),
            
            markScissors.topAnchor.constraint(equalTo: markRock.bottomAnchor, constant: 110),
            markScissors.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            markScissors.heightAnchor.constraint(equalToConstant: 80),
            markScissors.widthAnchor.constraint(equalToConstant: 80),
            
        ])
    }
}
