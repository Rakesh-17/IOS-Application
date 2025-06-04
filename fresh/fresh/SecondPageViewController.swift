//
//  SecondPageViewController.swift
//  fresh
//
//  Created by HTS-MAC on 30/01/25.
//

import UIKit

class SecondPageViewController: UIViewController {
    
    @IBOutlet public var essayLabel: UILabel!
    
    
    public var mgs = String()
    public var font = String()

    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .green
            essayLabel.text = mgs
            essayLabel.font = UIFont(name: font, size: 20)
            view.addSubview(essayLabel)
            self.navigationController?.isNavigationBarHidden = true
            
          
        }
    
    
    @IBAction func backbtclicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
}

