//
//  LoginVewController.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 25.09.2023.
//

import UIKit

class LoginVewController: UIViewController {
    
    static var globalUserName = ""
    private let logoView: UIImageView = {
        let imageView = UIImageView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 200,
                height: 200
            )
        )
        imageView.image = UIImage(named: "Logo")
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 7
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let welcomeLabel = UILabel(
        text: "Welcome to Rock-Paper-Scissors Game!",
        font: .robotoBold24(),
        textColor: .specialMidnightBlue
    )
    
    private let loginButton = CustomGreenButton(text: "Log in Me!")
    
    private let loginPasswordView = LoginPasswordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstaints()
       
    }
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(logoView)
        view.addSubview(welcomeLabel)
        view.addSubview(loginPasswordView)
        view.addSubview(loginButton)
        
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        
        let username = loginPasswordView.getLoginData()
        let password = loginPasswordView.getPasswordData()
        
        do {
            let users = RealmManager.shared.getUserData().filter("username = %@ AND password = %@", username, password)
            if let user = users.first {
                print("Пользователь успешно авторизован!")
            } else {
                print("Ошибка авторизации пользователя: неверное имя пользователя или пароль")
            }
            
        } catch let error as NSError {
            print("Ошибка авторизации пользователя: \(error.localizedDescription)")
        }
    }
}

extension LoginVewController {
    private func setConstaints() {
        NSLayoutConstraint.activate([
        
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 200),
            logoView.widthAnchor.constraint(equalToConstant: 200),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 26),
            
            loginPasswordView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30),
            loginPasswordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginPasswordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginPasswordView.heightAnchor.constraint(equalToConstant: 200),
            
            loginButton.topAnchor.constraint(equalTo: loginPasswordView.bottomAnchor, constant: 10),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 55)
            
        ])
    }
}
