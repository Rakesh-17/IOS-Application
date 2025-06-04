//
//  ViewController.swift
//  socialintegration
//
//  Created by HTS-MAC on 05/03/25.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
import FacebookLogin

class ViewController: UIViewController {

           
    @IBOutlet weak var appleview: UIView!
    @IBOutlet weak var facebookview: UIView!
    @IBOutlet weak var firebaseview: UIView!
    @IBOutlet weak var googleview: UIView!
    @IBOutlet weak var btnfirebasesignin: UIButton!
    @IBOutlet weak var socialicon: UIImageView!
    @IBOutlet weak var btngooglesignin: UIButton!
       //MARK: viewDidLoad
           override func viewDidLoad() {
               super.viewDidLoad()
               self.socialicon.layer.cornerRadius = CGRectGetWidth(self.socialicon.frame)/2.0
            //   self.btnfirebasesignin.layer.cornerRadius = CGRectGetWidth(self.btnfirebasesignin.frame)/3.0
             //  self.googleview.layer.cornerRadius = CGRectGetWidth(self.googleview.frame)/5.0
               googleview.layer.cornerRadius = 25.0
               firebaseview.layer.cornerRadius = 25.0
               facebookview.layer.cornerRadius = 25.0
               appleview.layer.cornerRadius = 25.0

               // Do any additional setup after loading the view.
           }
           
    @IBAction func firebasesigninbtnclicked(_ sender: Any) {
        /*
                   Auth.auth().signIn(withEmail: "user@example.com", password: "password123") { authResult, error in
                       if let error = error {
                           print("Sign in failed: \(error.localizedDescription)")
                           return
                       }
                       guard let user = authResult?.user else { return }
                       print("User signed in with UID: \(user.uid)")*/
                       let nextVC = FirebasePhoneloginViewController()
                       nextVC.modalPresentationStyle = .fullScreen
                       self.present(nextVC, animated: true)
                   
    }
    @IBAction func favebookbtclicked(_ sender: Any) {
        let loginManager = LoginManager()
                loginManager.logIn(permissions: ["public_profile", "email"], from: self) { result, error in
                    if let error = error {
                        print("Facebook login error: \(error.localizedDescription)")
                        return
                    }

                    if let result = result, !result.isCancelled {
                        // Login successful
                        self.fetchUserProfile()
                    } else {
                        print("User cancelled login")
                    }
                }
    }
    private func fetchUserProfile() {
            let request = GraphRequest(graphPath: "me", parameters: ["fields": "id, name, email"])
            request.start { _, result, error in
                if let error = error {
                    print("Error fetching user profile: \(error.localizedDescription)")
                    return
                }

                if let userData = result as? [String: Any] {
                    print("User data: \(userData)")
                    // Handle user data (e.g., navigate to the next screen)
                }
            }
        }
    
    @IBAction func googlesigninbtclicked(_ sender: Any) {
           print("signin clicked")
           GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
           //    self.btnGoogleSignOut.isHidden = true
           //    print("error*****",error)
               guard error == nil else { return }

             // If sign in succeeded, display the app's main content View.
               guard let signInResult = signInResult else {return   }
                   let user = signInResult.user
                   print("signin clicked*****")
               print(user)
               let nextVC = WelcomeViewController()
                   nextVC.user = user
                   nextVC.modalPresentationStyle = .fullScreen
                   self.present(nextVC, animated: true)
           }
       }
       
}

   
