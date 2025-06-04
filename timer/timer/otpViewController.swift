//
//  otpViewController.swift
//  timer
//
//  Created by HTS-MAC on 25/03/25.
//

import UIKit

class otpViewController: UIViewController {
    
      
       var timer: Timer?
       var timerValue = 60
       var isTimerRunning = false
       
    @IBOutlet weak var textfieldotp: UITextField!
    @IBOutlet weak var resendbt: UIButton!
    @IBOutlet weak var timerlabel: UILabel!
    // UI Elements
       
       
       

       override func viewDidLoad() {
           super.viewDidLoad()
           textfieldotp.placeholder = "Enter OTP"
           textfieldotp.borderStyle = .roundedRect
           textfieldotp.keyboardType = .numberPad
           resendbt.layer.cornerRadius = 10

           resendbt.addTarget(self, action: #selector(resendOTP), for: .touchUpInside)
           updateUI()
       }
       
      
       
       @objc func resendOTP() {
           // Reset values
           timerValue = 60
           isTimerRunning = true
           textfieldotp.text = "" // Clear the OTP field
           
           // Invalidate existing timer
           timer?.invalidate()
           
           // Start new timer
           timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
           
           updateUI()
           
           // Here you would typically call your OTP resend API
           print("OTP resent!")
       }
       
       @objc func updateTimer() {
           if timerValue > 0 {
               timerValue -= 1
           } else {
               // Timer finished
               isTimerRunning = false
               timer?.invalidate()
           }
           updateUI()
       }
       
       func updateUI() {
           if isTimerRunning {
               timerlabel.text = "Resend OTP in \(timerValue) seconds"
               resendbt.isHidden = true
           } else {
               timerlabel.text = ""
               textfieldotp.text = ""
               resendbt.isHidden = false
           }
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           timer?.invalidate()
       }
   }
