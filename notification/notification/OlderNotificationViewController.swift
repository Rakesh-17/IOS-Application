//
//  OlderNotificationViewController.swift
//  notification
//
//  Created by HTS-MAC on 27/02/25.
//

import UIKit
import UserNotifications

class OlderNotificationViewController: UIViewController,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

        var olderNotifications: [UNNotification] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.dataSource = self
            tableView.register(UINib(nibName: "mainTableViewCell", bundle: nil), forCellReuseIdentifier: "mainTableViewCell")
            tableView.translatesAutoresizingMaskIntoConstraints = false
            fetchOlderNotifications()
        }

        func fetchOlderNotifications() {
            UNUserNotificationCenter.current().getDeliveredNotifications { notifications in
                self.olderNotifications = notifications
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }

        // MARK: - UITableViewDataSource
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return olderNotifications.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell", for: indexPath) as? mainTableViewCell else{ return UITableViewCell() }
            let notification = olderNotifications[indexPath.row]
            cell.detailedlabel?.text = notification.request.content.body
            cell.normallabel?.text = notification.request.content.title
          
            return cell
        }
    @IBAction func backbt(_ sender: Any) {
        let nextVC = mainViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)

    }
    }
