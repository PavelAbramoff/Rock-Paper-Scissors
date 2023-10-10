//
//  ViewController.swift
//  Rock-Paper-Scissors
//
//  Created by Pavel on 2023-09-23.

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Variables
    
    var myPoints = 0
    var pcPoints = 0
    let array = ["rock","paper","scissors"]
    
    private let closeButton = CloseButton()
    
    private let playerPointDiscription: UILabel = {
        let label = UILabel()
        label.text = "\(UserSettings.userName)'s Points"
        label.textColor = .specialBlue
        label.font = .robotoBold20()
        label.layer.cornerRadius = 10
        label.addShadowOnView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let computerPointDiscription: UILabel = {
        let label = UILabel()
        label.text = "Computer Points"
        label.textColor = .specialBlue
        label.font = .robotoBold20()
        label.layer.cornerRadius = 10
        label.addShadowOnView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playerPoint: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .specialMidnightBlue
        label.font = .robotoBold48()
        label.layer.cornerRadius = 10
        label.addShadowOnView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let computerPoint: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .specialMidnightBlue
        label.font = .robotoBold48()
        label.layer.cornerRadius = 10
        label.addShadowOnView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let paperButton = MatchButton(text: "🤚", countRounds: 1)
    private let rockButton = MatchButton(text: "👊", countRounds: 1)
    private let scissorsButton = MatchButton(text: "✌️", countRounds: 1)
    
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
        rockButton.addTarget(self, action: #selector(rockButtonTapped), for: .touchUpInside)
        scissorsButton.addTarget(self, action: #selector(scissorsButtonTapped), for: .touchUpInside)
        paperButton.addTarget(self, action: #selector(paperButtonTapped), for: .touchUpInside)
        
        let syncTapButton = UITapGestureRecognizer(target: self, action: #selector(handleSyncTap(sender:)))
        syncTapButton.delegate = self
        let syncTapView = UITapGestureRecognizer(target: self, action: #selector(handleSyncTap(sender:)))
        syncTapView.delegate = self
        
        syncImage.addGestureRecognizer(syncTapView)
        
    }
    
    // MARK: ButtonActions
    
    @objc private func rockButtonTapped(button: MatchButton) {
        startSpinning()
        let randomSelected = Int(arc4random_uniform(3))
        let pcSelected = array[randomSelected]
        
        if pcSelected == "rock" {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningRock)
            
        } else if pcSelected == "paper" {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningPaper)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: recordPcPoinnts)
            
        } else if pcSelected == "scissors" {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningScissorsr)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: recordMyPoints)
        }
    }
    
    @objc private func scissorsButtonTapped(button: MatchButton) {
        startSpinning()
        let randomSelected = Int(arc4random_uniform(3))
        let pcSelected = array[randomSelected]
        
        if pcSelected == "rock" {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningRock)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: recordMyPoints)
            
        } else if pcSelected == "paper" {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningPaper)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: recordPcPoinnts)
            
        } else if pcSelected == "scissors" {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningScissorsr)
        }
    }
    
    @objc private func paperButtonTapped(button: MatchButton) {
        startSpinning()
        let randomSelected = Int(arc4random_uniform(3))
        let pcSelected = array[randomSelected]
        
        if pcSelected == "rock" {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningRock)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: recordMyPoints)
            
        } else if pcSelected == "paper" {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningPaper)
            
        } else if pcSelected == "scissors" {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningScissorsr)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: recordPcPoinnts)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func recordMyPoints() {
        myPoints += 1
        playerPoint.text = String(myPoints)
    }
    
    func recordPcPoinnts() {
        pcPoints += 1
        computerPoint.text = String(pcPoints)
    }
    
    func startSpinning() {
        syncImage.image = UIImage(named:"fon")
        syncImage.startRotating()
    }
    
    func stopSpinningRock() {
        syncImage.stopRotating()
        syncImage.image = UIImage(named:"rock2")
    }
    
    func stopSpinningPaper() {
        syncImage.stopRotating()
        syncImage.image = UIImage(named:"paper2")
    }
    
    func stopSpinningScissorsr() {
        syncImage.stopRotating()
        syncImage.image = UIImage(named:"scissors2")
    }
    
    @objc func handleSyncTap(sender: UITapGestureRecognizer? = nil) {
        startSpinning()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.stopSpinningRock()
        }
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
}

// MARK: Extansions

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
