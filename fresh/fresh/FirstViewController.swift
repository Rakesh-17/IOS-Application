//
//  FirstViewController.swift
//  fresh
//
//  Created by HTS-MAC on 24/01/25.
//

import UIKit

class FirstViewController: UIViewController {

   
    @IBOutlet var mainview: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func colorbtclicked(_ sender: Any) {
        let fullScreenVC = FirstcolorViewController()
        fullScreenVC.modalPresentationStyle = .fullScreen
        self.present(fullScreenVC, animated: true, completion: nil)
        
    }
    
    @IBAction func imagebtclicked(_ sender: Any) {
        let fullScreenVC =  FirstimageViewController()
        fullScreenVC.modalPresentationStyle = .fullScreen
        self.present(fullScreenVC, animated: true, completion: nil)
    }
   
    
}
