//
//  StatisticViewController.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 01.10.2023.
//

import UIKit

class StatisticViewController: UIViewController {
    
    private var statisticArray = [LeaderboardEntry]()
    
    private var mockArray: [LeaderboardEntry] =
    [LeaderboardEntry(name: "Anigilytor", score: 3, rank: 0),
     LeaderboardEntry(name: "Viking", score: 7, rank: 0),
     LeaderboardEntry(name: "Superman", score: 9, rank: 0),
     LeaderboardEntry(name: "Dred", score: 12, rank: 0),
     LeaderboardEntry(name: "Winer", score: 50, rank: 0),]
    
    private let leaderBoardLabel: UILabel = {
        let label = UILabel()
        label.text = "LEADERBOARD"
        label.font = .robotoBold24()
        label.textColor = .specialGrayText
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Today", "Weak", "All Time"])
        segment.selectedSegmentIndex = 0
        segment.backgroundColor = .specialBlue
        segment.selectedSegmentTintColor = .specialYellow
        let font = UIFont.robotoMedium16()
        segment.setTitleTextAttributes([.foregroundColor: UIColor.white,
                                        .font: font as Any],
                                       for: .normal)
        segment.setTitleTextAttributes([.foregroundColor: UIColor.specialGrayText,
                                        .font: font as Any],
                                       for: .selected)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    private let statisticTableView = StatTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateStatistic()
    }
    
    override func viewDidLayoutSubviews() {
      
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(leaderBoardLabel)
        view.addSubview(segmentedControl)
        segmentedControl.addTarget(self, action: #selector(segmentedControlTapped), for: .valueChanged)
        view.addSubview(statisticTableView)
    }
    
    private func updateStatistic() {
        statisticArray = mockArray
        let userArrayModel = RealmManager.shared.getUserData()
        let userName = userArrayModel[0].username
        let numberWins = RealmManager.shared.getUserWins(name: userName)
        let userLeaderboardModel = LeaderboardEntry(name: userName, score: numberWins, rank: 1)
        statisticArray.append(userLeaderboardModel)
        statisticTableView.setStatisticArray(statisticArray)
        statisticTableView.reloadData()
    }
    
    @objc private func segmentedControlTapped() {
        updateStatistic()
    }
    
}

extension StatisticViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
    
            leaderBoardLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            leaderBoardLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            leaderBoardLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            segmentedControl.topAnchor.constraint(equalTo: leaderBoardLabel.bottomAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            segmentedControl.heightAnchor.constraint(equalToConstant: 30),
            
            statisticTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 50),
            statisticTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            statisticTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            statisticTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
}

