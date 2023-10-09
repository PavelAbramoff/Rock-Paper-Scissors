//
//  ViewController.swift
//  Rock-Paper-Scissors
//
//  Created by Pavel on 2023-09-23.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Variables
    var myPoints = 0
    var pcPoints = 0
    let array = ["rock2","paper2","scissors2"]
    
    private let closeButton = CloseButton()
    
    private let playerPointDiscription: UILabel = {
                let label = UILabel()
                label.text = "Your Points"
                label.textColor = .blue
                label.font = .robotoBold20()
                label.layer.cornerRadius = 10
                label.addShadowOnView()
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()

    private let computerPointDiscription: UILabel = {
                let label = UILabel()
                label.text = "Computer Points"
                label.textColor = .blue
                label.font = .robotoBold20()
                label.layer.cornerRadius = 10
                label.addShadowOnView()
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()

    
    private let playerPoint: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .blue
        label.font = .robotoBold48()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let computerPoint: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .blue
        label.font = .robotoBold48()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let paperButton = MatchButton(text: "Paper", countRounds: 1)
    private let rockButton = MatchButton(text: "Rock", countRounds: 1)
    private let scissorsButton = MatchButton(text: "Scissors", countRounds: 1)
    
    private let syncImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var syncContainer = UIStackView(
        arrangedSubviews: [rockButton,scissorsButton,paperButton],
        axis: .horizontal,
        spacing:25,
        distribution: .fillEqually)
    
    let tapSyncMethod = "handleSyncTap:"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(closeButton)
        view.addSubview(playerPointDiscription)
        view.addSubview(computerPointDiscription)
        view.addSubview(playerPoint)
        view.addSubview(computerPoint)
        view.addSubview(syncImage)
        view.addSubview(syncContainer)
        
        setConstraint()
        view.backgroundColor = .white
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        let syncTapButton = UITapGestureRecognizer(target: self, action: #selector(handleSyncTap(sender:)))
        syncTapButton.delegate = self
        let syncTapView = UITapGestureRecognizer(target: self, action: #selector(handleSyncTap(sender:)))
        syncTapView.delegate = self
        
        syncImage.addGestureRecognizer(syncTapView)
        paperButton.addGestureRecognizer(syncTapButton)
        rockButton.addGestureRecognizer(syncTapButton)
        scissorsButton.addGestureRecognizer(syncTapButton)
    }
    
    // MARK: ButtonActions
    
    private func rockSelected(_ sender: Any) {
        
        let randomCelected = Int(arc4random_uniform(3))
        let pcCelected = array[randomCelected]
        
        if pcCelected == "rock2" {
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startSpinning() {
        syncImage.image = UIImage(named:"fon")
        syncImage.startRotating()
    }
    
    func stopSpinning() {
        syncImage.stopRotating()
        syncImage.image = UIImage(named:"rock2")
    }
    
    @objc func handleSyncTap(sender: UITapGestureRecognizer? = nil) {
        startSpinning()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.stopSpinning()
        }
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
}

extension ViewController {
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            
            playerPointDiscription.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            playerPointDiscription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            computerPointDiscription.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            computerPointDiscription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
                        
            playerPoint.topAnchor.constraint(equalTo: playerPointDiscription.bottomAnchor, constant: 20),
            playerPoint.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
                        
            computerPoint.topAnchor.constraint(equalTo: computerPointDiscription.bottomAnchor, constant: 20),
            computerPoint.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            
            syncImage.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 210),
            syncImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            syncImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            syncImage.heightAnchor.constraint(equalToConstant: 300),
            syncImage.widthAnchor.constraint(equalToConstant: 300),
            
            syncContainer.topAnchor.constraint(equalTo: syncImage.bottomAnchor, constant: 100),
            syncContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            syncContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            syncContainer.heightAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}


