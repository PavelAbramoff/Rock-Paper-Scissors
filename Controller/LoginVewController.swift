//
//  LoginVewController.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 25.09.2023.
//

import UIKit

class LoginVewController: UIViewController {
    
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
    
    private let loginPasswordView = LoginPasswordView()
    
    private let loginButton = CustomButton(
        text: "Authorise me!",
        color: .specialGreenText,
        textColor: .white
    )
    
    private let registerButton = CustomButton(
        text: "I'm new, register me!",
        color: .specialYellow,
        textColor: .specialGrayText
    )
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstaints()
        setupDismissKeyboardGesture()
        setupKeyboardHiding()
       
    }
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(logoView)
        view.addSubview(welcomeLabel)
        view.addSubview(loginPasswordView)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        
        let username = loginPasswordView.getLoginData()
        let password = loginPasswordView.getPasswordData()
        
        if username.isEmpty || password.isEmpty {
            showAlert(title: "Error", message: "Enter all parameters")
                       resetValues()
        }
        
        do {
            let users = RealmManager.shared.getUserData().filter(
                "username = %@ AND password = %@",
                username,
                password
            )
            if let user = users.first {
                print("Пользователь успешно авторизован!")
                UserSettings.userName = username
                UserSettings.isUserAuthorised = true
                UserSettings.isThisFirstRunning = false
                
                presentingViewController?.dismiss(animated: true)
                
                let tabBar = MainTabBarController()
                tabBar.modalPresentationStyle = .fullScreen
                
                tabBarController?.present(
                    tabBar,
                    animated: true)
            } else {
                print("Ошибка авторизации пользователя: неверное имя пользователя или пароль")
                
                
                showAlert(title: "Error", message: "Please log in to your User account or register yourself")
                resetValues()
            }
            
        } catch let error as NSError {
            print("Ошибка авторизации пользователя: \(error.localizedDescription)")
        }
    }
  
    private func resetValues() {
        loginPasswordView.deleteTextTextField()
    }

    
    @objc private func registerButtonTapped() {
        let registerVC = RegistrationViewController()
        registerVC.modalPresentationStyle = .fullScreen
        present(registerVC, animated: true)
    }
    
}
//MARK: - SetConstraints
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
            loginButton.heightAnchor.constraint(equalToConstant: 55),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 55)
            
        ])
    }
}
