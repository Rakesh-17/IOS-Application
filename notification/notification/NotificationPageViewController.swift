//
//  NotificationPageViewController.swift
//  notification
//
//  Created by HTS-MAC on 28/02/25.
//

import UIKit

class NotificationPageViewController: UIViewController {

    var notificationTitle: String?
       var notificationMessage: String?

       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .white
           
           let titleLabel = UILabel()
           titleLabel.text = notificationTitle
           titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
           titleLabel.textAlignment = .center
           titleLabel.translatesAutoresizingMaskIntoConstraints = false
           
           let messageLabel = UILabel()
           messageLabel.text = notificationMessage
           messageLabel.font = UIFont.systemFont(ofSize: 16)
           messageLabel.textAlignment = .center
           messageLabel.numberOfLines = 0
           messageLabel.translatesAutoresizingMaskIntoConstraints = false
           
           view.addSubview(titleLabel)
           view.addSubview(messageLabel)
           
           NSLayoutConstraint.activate([
               titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
               titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
               
               messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
               messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
           ])
       }
   }
