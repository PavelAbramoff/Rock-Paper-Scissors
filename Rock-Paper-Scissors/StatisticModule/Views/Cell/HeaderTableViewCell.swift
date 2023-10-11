//
//  HeaderTableViewCell.swift
//  Rock-Paper-Scissors
//
//  Created by Belov Igor on 11.10.2023.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    static let headerTableViewCell = "headerTableViewCell"
    
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.text = "PLACE"
        label.textColor = .specialMidnightBlue
        label.backgroundColor = .green
        label.textAlignment = .center
        label.font = .robotoBold16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "USERNAME"
        label.backgroundColor = .yellow
        label.textColor = .specialMidnightBlue
        label.font = .robotoBold16()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let victoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "VICTORIES"
        label.backgroundColor = .red
        label.textColor = .specialMidnightBlue
        label.font = .robotoBold16()
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
        addSubview(placeLabel)
        addSubview(usernameLabel)
        addSubview(victoriesLabel)
    }
}

extension HeaderTableViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            placeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            placeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            placeLabel.widthAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: placeLabel.trailingAnchor, constant: 10),
            usernameLabel.widthAnchor.constraint(equalToConstant: 140),
            
            victoriesLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            victoriesLabel.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: 10),
            victoriesLabel.widthAnchor.constraint(equalToConstant: 90)
            
        ])
    }
}
