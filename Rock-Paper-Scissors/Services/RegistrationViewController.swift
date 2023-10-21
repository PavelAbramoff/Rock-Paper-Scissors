//
//  RegistrationViewController.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 07.10.2023.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    private lazy var closeButton = CloseButton(type: .system)
    
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
        text: "Nice to meet You!",
        font: .robotoBold24(),
        textColor: .specialMidnightBlue
    )
    
    private let registerButton = CustomButton(text: "Register Me!", color: .specialYellow, textColor: .specialGrayText)
    
    private let loginPasswordView = LoginPasswordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstaints()
        setupDismissKeyboardGesture()
        setupKeyboardHiding()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(closeButton)
        view.addSubview(logoView)
        view.addSubview(welcomeLabel)
        view.addSubview(loginPasswordView)
        view.addSubview(registerButton)
        
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func registerButtonTapped() {
        
        let username = loginPasswordView.getLoginData()
        let password = loginPasswordView.getPasswordData()
        
        if username.isEmpty || password.isEmpty {
            showAlert(title: "Error", message: "Enter all parameters")
            resetValues()
        }
            
                let newUser = UserModel()
                
                newUser.username = username
                newUser.password = password
                
                RealmManager.shared.saveUserData(newUser)
                
                showAlert(title: "Succes 👍", message: "Hello, \(username)")
                
                UserSettings.userName = username
                UserSettings.isUserAuthorised = true
                UserSettings.isThisFirstRunning = false
                
                let userDefaults = UserDefaults.standard
                userDefaults.set(true, forKey: "isUserAuthorised")
                userDefaults.set(username, forKey: "username")
                presentingViewController?.dismiss(animated: true)
                
                let tabBar = MainTabBarController()
                tabBar.modalPresentationStyle = .fullScreen
                
                tabBarController?.present(
                    tabBar,
                    animated: true)
        }
    
    private func resetValues() {
        loginPasswordView.deleteTextTextField()
    }
  
}
//MARK: - SetConstraints
extension RegistrationViewController {
    private func setConstaints() {
        NSLayoutConstraint.activate([
        
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            
            logoView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 30),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 200),
            logoView.widthAnchor.constraint(equalToConstant: 200),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 20),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 26),
            
            loginPasswordView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30),
            loginPasswordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginPasswordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginPasswordView.heightAnchor.constraint(equalToConstant: 200),
            
            registerButton.topAnchor.constraint(equalTo: loginPasswordView.bottomAnchor, constant: 10),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 55)
            
        ])
    }
}
