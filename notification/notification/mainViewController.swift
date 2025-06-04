//
//  mainViewController.swift
//  notification
//
//  Created by HTS-MAC on 27/02/25.
//

import UIKit
import UserNotifications

class mainViewController: UIViewController {

    @IBOutlet weak var notilabel: UILabel!
    var olderNotification: [UNNotification] = []

    var olderNotifications: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchOlderNotifications()
        // Do any additional setup after loading the view.
    }
    func fetchOlderNotifications() {
        UNUserNotificationCenter.current().getDeliveredNotifications { notifications in
            self.olderNotification = notifications
            
        }
    }
    
    @IBAction func Addtask(_ sender: Any) {
        let nextVC = ViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
    
    @IBAction func Oldernoti(_ sender: Any) {
        let notification = olderNotification.last
        
        notilabel.text = notification?.request.content.title
     
    }
    
    

}
