//
//  NextViewController.swift
//  allinone
//
//  Created by HTS-MAC on 23/01/25.
//

import UIKit

class NextViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Step 1: Setup basic view properties
        view.backgroundColor = .white// Background color
        
    }
    
    @IBAction func pageviewclicked(_ sender: Any) {
        let nextVC = pageViewController()
        present(nextVC, animated: true)
    }
    
    @IBAction func goback(_ sender: Any) {
        present(ViewController(), animated: true)
        }
    @IBAction func tabbarclicked(_ sender: Any) {
        let nextVC = tabbarViewController()
        present(nextVC, animated: true)
    }
}
