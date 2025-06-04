//
//  ViewController.swift
//  timer
//
//  Created by HTS-MAC on 25/03/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Stopbt: UIButton!
    @IBOutlet weak var startbt: UIButton!
    @IBOutlet weak var labeltimer: UILabel!
    var timer: Timer?
    var timeRemaining = 60
       
       

       override func viewDidLoad() {
           super.viewDidLoad()
           labeltimer.text = "60"
           startbt.layer.cornerRadius = 10
           Stopbt.layer.cornerRadius = 10

           
       }
       
      
    @IBAction func Stopbtclicked(_ sender: Any) {
        timer?.invalidate()
}
    @IBAction func starttimerclicked(_ sender: Any) {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
   
       
       @objc func updateTimer() {
           if timeRemaining > 0 {
               timeRemaining -= 1
               labeltimer.text = "\(timeRemaining)"
           } else {
               timer?.invalidate()
           }
       }
       
       // Clean up the timer when the view disappears
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           timer?.invalidate()
       }
   }

       
