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
    
    var gamesCounter = 0
    
    let array = ["rock","paper","scissors"]
    
    private let closeButton = CloseButton()
    
    private let roundCounterLabel: UILabel = {
        let label = UILabel()
        label.text = "Game up to \(UserSettings.roundsNumber) points"
        label.textColor = .specialMidnightBlue
        label.font = .robotoBold24()
        label.layer.cornerRadius = 10
        label.addShadowOnView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let roundLabel: UILabel = {
        let label = UILabel()
        label.text = "Round 1"
        label.textColor = .specialMidnightBlue
        label.font = .robotoBold24()
        label.layer.cornerRadius = 10
        label.addShadowOnView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playerPointDiscription: UILabel = {
        let label = UILabel()
        let userDefaults = UserDefaults.standard
        let userName = userDefaults.string(forKey: "username") ?? "Unknown"
        label.text = "\(userName)'s Points"
        label.textColor = .specialBlue
        label.font = .robotoBold20()
        label.layer.cornerRadius = 10
        label.addShadowOnView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let computerPointDiscription: UILabel = {
        let label = UILabel()
        label.text = "Computer's Points"
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
        view.addSubview(roundCounterLabel)
        view.addSubview(roundLabel)
        view.addSubview(playerPointDiscription)
        view.addSubview(computerPointDiscription)
        view.addSubview(playerPoint)
        view.addSubview(computerPoint)
        view.addSubview(syncImage)
        view.addSubview(syncContainer)
        
        setConstraint()
        view.backgroundColor = .specialBackground
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        roundLabel.isHidden = gamesCounter == 0
    }
    
    // MARK: ButtonActions
    
    @objc private func rockButtonTapped(button: MatchButton) {
        startSpinning()
        let randomSelected = Int(arc4random_uniform(3))
        let pcSelected = array[randomSelected]
        
        if pcSelected == "rock" {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningRock)
            
        } else if pcSelected == "paper" {
            gamesCounter += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningPaper)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: recordPcPoinnts)
            
        } else if pcSelected == "scissors" {
            gamesCounter += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningScissorsr)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: recordMyPoints)
        }
    }
    
    @objc private func scissorsButtonTapped(button: MatchButton) {
        startSpinning()
        let randomSelected = Int(arc4random_uniform(3))
        let pcSelected = array[randomSelected]
        
        if pcSelected == "rock" {
            gamesCounter += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningRock)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: recordPcPoinnts)
            
        } else if pcSelected == "paper" {
            gamesCounter += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningPaper)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: recordMyPoints)
            
        } else if pcSelected == "scissors" {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningScissorsr)
        }
    }
    
    @objc private func paperButtonTapped(button: MatchButton) {
        startSpinning()
        let randomSelected = Int(arc4random_uniform(3))
        let pcSelected = array[randomSelected]
        
        if pcSelected == "rock" {
            gamesCounter += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningRock)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: recordMyPoints)
            
        } else if pcSelected == "paper" {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningPaper)
            
        } else if pcSelected == "scissors" {
            gamesCounter += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: stopSpinningScissorsr)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: recordPcPoinnts)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func whoIsWon() -> String {
        var result = ""
        if pcPoints > myPoints {
            result = "PC won!😓"
        }
        if myPoints > pcPoints {
            result = "You won! 🥇"
        }
        if myPoints == pcPoints {
            result = "Nobody won 🤷‍♂️"
        }
          return result
    }
    
    func saveStatistic() {
        let username = UserSettings.userName
        let roundsNumber = gamesCounter
        let victorysNumber = myPoints
        
        let newStatRecord = UserStatisticModel()
        
        newStatRecord.username = username
        newStatRecord.gamesNumber = roundsNumber
        newStatRecord.winsNumber = victorysNumber
        
        RealmManager.shared.saveUserStatisticData(newStatRecord)
    }
    
    func recordMyPoints() {
        myPoints += 1
        if myPoints < UserSettings.roundsNumber {
            roundLabel.text = "Round \(gamesCounter)"
            playerPoint.text = String(myPoints)
        } else {
            roundLabel.text = "Round \(gamesCounter)"
            playerPoint.text = String(myPoints)
            showAlert(title: "Game over", message: "\(whoIsWon())")
            saveStatistic()
            syncContainer.isHidden = true
        }
    }
    
    func recordPcPoinnts() {
        pcPoints += 1
        if pcPoints < UserSettings.roundsNumber {
            roundLabel.text = "Round \(gamesCounter)"
            computerPoint.text = String(pcPoints)
        } else {
            roundLabel.text = "Round \(gamesCounter)"
            computerPoint.text = String(pcPoints)
            showAlert(title: "Game over", message: "\(whoIsWon())")
            saveStatistic()
            syncContainer.isHidden = true
        }
    }
    
    func startSpinning() {
        roundLabel.isHidden = false
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
            
            roundCounterLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 20),
            roundCounterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            roundCounterLabel.heightAnchor.constraint(equalToConstant: 30),
            
            roundLabel.topAnchor.constraint(equalTo: roundCounterLabel.bottomAnchor, constant: 20),
            roundLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            roundLabel.heightAnchor.constraint(equalToConstant: 30),
            
            playerPointDiscription.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 10),
            playerPointDiscription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            computerPointDiscription.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 10),
            computerPointDiscription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            playerPoint.topAnchor.constraint(equalTo: playerPointDiscription.bottomAnchor, constant: 20),
            playerPoint.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            
            computerPoint.topAnchor.constraint(equalTo: computerPointDiscription.bottomAnchor, constant: 20),
            computerPoint.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            
            syncImage.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 230),
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
