//
//  StatTableViewCell.swift
//  Rock-Paper-Scissors
//
//  Created by Belov Igor on 11.10.2023.
//

import UIKit

class StatTableViewCell: UITableViewCell {
    
    static let idStaticticsCell = "idStaticticsCell"
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .specialMidnightBlue
        label.textAlignment = .center
        label.font = .robotoMedium16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Player"
        label.textColor = .specialMidnightBlue
        label.font = .robotoMedium16()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "310"
        label.textColor = .specialMidnightBlue
        label.font = .robotoMedium16()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(rankLabel)
        addSubview(nameLabel)
        addSubview(scoreLabel)
    }
    
    func configure(_ model: LeaderboardEntry) {
        nameLabel.text = model.name
        scoreLabel.text = "\(model.score)"
        rankLabel.text = "\(model.rank)"
    }
}

extension StatTableViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            rankLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            rankLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            rankLabel.widthAnchor.constraint(equalToConstant: 60),
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: rankLabel.trailingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalToConstant: 140),
            
            scoreLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            scoreLabel.widthAnchor.constraint(equalToConstant: 90)
            
        ])
    }
}
