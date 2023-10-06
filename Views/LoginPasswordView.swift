//
//  LoginPasswordView.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 25.09.2023.
//

import UIKit

class LoginPasswordView: UIView {
    
    private let loginLabel = UILabel(text: "Login: ",
                                     font: .robotoBold20(),
                                     textColor: .specialGrayText)
    
    private let loginTextField = CuctomTextField()

    private let passwordLabel = UILabel(text: "Password: ",
                                        font: .robotoBold20(),
                                        textColor: .specialGrayText)
    
    private let passwordTextField = CuctomTextField()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(loginLabel)
        addSubview(loginTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
    }
    
    func getLoginData() -> String {
        guard let login = loginTextField.text else {return ""}
        return login
    }
    
    func getPasswordData() -> String {
        guard let password = passwordTextField.text else {return ""}
        return password
    }
}

extension LoginPasswordView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: topAnchor),
            loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 10),
            loginTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
