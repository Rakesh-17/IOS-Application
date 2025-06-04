//
//  TableViewCell.swift
//  test
//
//  Created by HTS-MAC on 29/05/25.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let identifier = "TableViewCell"
        
        private let nameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let descriptionLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .darkGray
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let modeLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.italicSystemFont(ofSize: 12)
            label.textColor = .systemBlue
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let dateLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 10)
            label.textColor = .lightGray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let containerView: UIView = {
            let view = UIView()
            view.backgroundColor = .systemGray6
            view.layer.cornerRadius = 8
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupViews()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupViews() {
            backgroundColor = .clear
            selectionStyle = .none
            
            // Add container view
            contentView.addSubview(containerView)
            
            // Add labels to container
            containerView.addSubview(nameLabel)
            containerView.addSubview(descriptionLabel)
            containerView.addSubview(modeLabel)
            containerView.addSubview(dateLabel)
            
            // Constraints
            NSLayoutConstraint.activate([
                containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                
                nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
                nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
                nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
                
                descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
                descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
                descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
                
                modeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
                modeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
                
                dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
                dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
                dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12)
            ])
        }
        
        func configure(with task: Task) {
            nameLabel.text = task.name
            descriptionLabel.text = task.description
            modeLabel.text = task.mode
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .short
           // dateLabel.text = dateFormatter.string(from: task.dateCreated)
        }
    }
