//
//  FirebasePhoneloginViewController.swift
//  socialintegration
//
//  Created by HTS-MAC on 14/03/25.
//

import UIKit
import FirebaseAuth

class FirebasePhoneloginViewController: UIViewController {

    
    @IBOutlet weak var phonenumbertextfeild: UITextField!
        

    @IBOutlet weak var signinbt: UIButton!
   

        // MARK: - Lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            signinbt.clipsToBounds = true
            signinbt.layer.cornerRadius = 5

            
        }

        

       
       
    @IBAction func signinbtclicked(_ sender: Any) {
        guard let phoneNumber = phonenumbertextfeild.text, !phoneNumber.isEmpty else {
            showToast(message: "Invalid phone number. Please enter a 10-digit number.")
            return
        }
        
             let phoneRegex = "^\\+91[0-9]{10}$" // Example: 10-digit number
             let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)

      if !phoneTest.evaluate(with: phoneNumber) {
                 showToast(message: "Invalid phone number. Please enter a 10-digit number.")
          return
            }
        // Send verification code to the user's phone
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            if let error = error {
                self.showToast(message: "Failed to send verification code.")

                print("Failed to send verification code: \(error.localizedDescription)")
                return
            }

            // Save the verification ID
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")

            // Prompt the user to enter the verification code
            self.promptForVerificationCode()
        }
        
    }
    
       
    @IBAction func backbtclicked(_ sender: Any) {
        let nextVC = ViewController()
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
   
    
          
   
          
    func showToast(message: String, duration: TimeInterval = 2.0) {
           let toastLabel = UILabel()
           toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
           toastLabel.textColor = UIColor.white
           toastLabel.textAlignment = .center
           toastLabel.font = UIFont.systemFont(ofSize: 14)
           toastLabel.text = message
           toastLabel.alpha = 0.0
           toastLabel.layer.cornerRadius = 10
           toastLabel.clipsToBounds = true

           let maxWidth = self.view.bounds.width - 40
           let size = toastLabel.sizeThatFits(CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude))
           toastLabel.frame = CGRect(x: 20, y: self.view.bounds.height - 100, width: maxWidth, height: size.height + 20)

           self.view.addSubview(toastLabel)

           UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
               toastLabel.alpha = 1.0
           }, completion: { _ in
               UIView.animate(withDuration: 0.5, delay: duration, options: .curveEaseOut, animations: {
                   toastLabel.alpha = 0.0
               }, completion: { _ in
                   toastLabel.removeFromSuperview()
               })
           })
       }

           private func promptForVerificationCode() {
               let alert = UIAlertController(title: "Verification Code", message: "Enter the code sent to your phone", preferredStyle: .alert)
               alert.addTextField { textField in
                   textField.placeholder = "Verification code"
                   textField.keyboardType = .numberPad
               }
               alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { _ in
                   guard let verificationCode = alert.textFields?.first?.text, !verificationCode.isEmpty else {
                       self.showToast(message: "Please enter a valid verification code")
                       print("Please enter a valid verification code")
                       return
                   }

                   // Verify the code
                   self.verifyCode(verificationCode)
               }))
               present(alert, animated: true, completion: nil)
           }

           private func verifyCode(_ verificationCode: String) {
               guard let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") else {
                   print("Verification ID not found")
                   return
               }

               let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)

               // Sign in the user
               Auth.auth().signIn(with: credential) { authResult, error in
                   if let error = error {
                       self.showToast(message: "Please enter a valid verification code")
                       print("Sign in failed: \(error.localizedDescription)")
                       return
                   }
                   let nextVC = FirebaseloginsucessViewController()
                   nextVC.modalPresentationStyle = .fullScreen
                   self.present(nextVC, animated: true)
                   
               }
          
           }

          
       }
       

