//
//  LoginVewController.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 25.09.2023.
//

import UIKit

class LoginVewController: UIViewController {
    
    private let logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 7
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let loginPasswordView = LoginPasswordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstaints()
       
    }
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(logoView)
        view.addSubview(loginPasswordView)

    }
}

extension LoginVewController {
    private func setConstaints() {
        NSLayoutConstraint.activate([
        
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 150),
            logoView.widthAnchor.constraint(equalToConstant: 150),
            
            loginPasswordView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 40),
            loginPasswordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginPasswordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            loginPasswordView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
