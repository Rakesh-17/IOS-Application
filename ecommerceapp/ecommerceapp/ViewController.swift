//
//  ViewController.swift
//  ecommerceapp
//
//  Created by HTS-MAC on 11/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signuppage: UIView!
    @IBOutlet weak var signinview: UIView!
    @IBOutlet weak var Titleview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func signupbtclicked(_ sender: Any) {
    /*    print("signin clicked")
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            //    self.btnGoogleSignOut.isHidden = true
            print("error*****",error)
            guard error == nil else { return }
            
            // If sign in succeeded, display the app's main content View.
            guard let signInResult = signInResult else {return   }
            let user = signInResult.user
            print("signin clicked*****")
            
            */
            let nextVC = HomeViewController()
            
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true)
        
    }
    @IBAction func segmentedcontrolact(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            signuppage.isHidden = true
            signinview.isHidden = false
        }
        else if sender.selectedSegmentIndex == 1{
            signuppage.isHidden = false
            signinview.isHidden = true
        }
    }
    @IBAction func signinbtclicked(_ sender: Any) {
        let nextVC = HomeViewController()
    
    nextVC.modalPresentationStyle = .fullScreen
    present(nextVC, animated: true)
    }
    @IBAction func closebtclicked(_ sender: Any) {
        
        Titleview.isHidden = true
    }
    

}
