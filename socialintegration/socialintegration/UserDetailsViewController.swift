//
//  UserDetailsViewController.swift
//  socialintegration
//
//  Created by HTS-MAC on 06/03/25.
//

import UIKit

class UserDetailsViewController: UIViewController {
   
    var userNamelb: String = ""
    var userEmailib: String = ""
    var userphonelb: String = ""
    @IBOutlet weak var userphoneno: UILabel!
    @IBOutlet weak var usermailid: UILabel!
    @IBOutlet weak var username: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        username.text = userNamelb
        usermailid.text = userEmailib
        userphoneno.text = userphonelb


        // Do any additional setup after loading the view.
    }

    @IBAction func backbtclicked(_ sender: Any) {
        let nextVC = WelcomeViewController()
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    
}

