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
        
        view.addSubview(syncImage)
        view.addSubview(syncContainer)
        setConstraint()
        view.backgroundColor = .white
        
        let syncTapButton = UITapGestureRecognizer(target: self, action: #selector(handleSyncTap(sender:)))
        syncTapButton.delegate = self
        
        let syncTapView = UITapGestureRecognizer(target: self, action: #selector(handleSyncTap(sender:)))
        syncTapView.delegate = self
        
        syncImage.addGestureRecognizer(syncTapView)
        paperButton.addGestureRecognizer(syncTapButton)
        rockButton.addGestureRecognizer(syncTapButton)
        scissorsButton.addGestureRecognizer(syncTapButton)
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
}

extension ViewController {
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            
            syncImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 220),
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


