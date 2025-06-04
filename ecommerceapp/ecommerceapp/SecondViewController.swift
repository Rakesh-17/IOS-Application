//
//  SecondViewController.swift
//  ecommerceapp
//
//  Created by HTS-MAC on 15/04/25.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backbtclicked(_ sender: Any) {
        let nextVC = HomeViewController()
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}
