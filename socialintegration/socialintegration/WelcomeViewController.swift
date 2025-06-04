//
//  WelcomeViewController.swift
//  socialintegration
//
//  Created by HTS-MAC on 06/03/25.
//

import UIKit
import GoogleSignIn

class WelcomeViewController: UIViewController {

    var user: GIDGoogleUser?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func showuserdetailsbt(_ sender: Any) {
        print("btclicked")
        guard let user = user else { return }
        print(user)
        print(user.profile?.name)
        print(user.profile?.email)
        print(user.profile?.familyName)

                // Navigate to the details page
        let detailsVC = UserDetailsViewController()
        detailsVC.userEmailib = user.profile!.email
        detailsVC.userphonelb = user.profile!.givenName! // Note: Phone number is not provided by Google
        detailsVC.userNamelb = user.profile!.name
        
        detailsVC.modalPresentationStyle = .fullScreen
        present(detailsVC, animated: true)
            
    }
    

    @IBAction func backbtclicked(_ sender: Any) {
        let nextVC = ViewController()
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
}
