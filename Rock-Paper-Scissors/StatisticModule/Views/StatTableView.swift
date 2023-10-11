//
//  StatTableView.swift
//  Rock-Paper-Scissors
//
//  Created by Belov Igor on 11.10.2023.
//

import UIKit

class StatTableView: UITableView {

    private var staticticArray = [LeaderboardEntry]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        setDelegate()
        register(StatTableViewCell.self, forCellReuseIdentifier: StatTableViewCell.idStaticticsCell)
        register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.headerTableViewCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .none
        separatorStyle = .singleLine
        separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0) //реализация стандартного разделителя
        bounces = false
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func setDelegate() {
        dataSource = self
        delegate = self
    }

    func setStatisticArray(_ array: [LeaderboardEntry]) {
        staticticArray = array
    }
}

//MARK: - UITableViewDataSource

extension StatTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        staticticArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.headerTableViewCell,
                                                           for: indexPath) as? HeaderTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StatTableViewCell.idStaticticsCell,
                                                       for: indexPath) as? StatTableViewCell else {
            return UITableViewCell()
        }
        staticticArray = staticticArray.sorted { $0.score > $1.score }
        for i in 0..<staticticArray.count {
            staticticArray[i].rank = i + 1
        }
        let statisticModel = staticticArray[indexPath.row - 1]
        cell.configure(statisticModel)
        return cell
    }
}

//MARK: - UITableViewDelegate

extension StatTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        30
    }
}

