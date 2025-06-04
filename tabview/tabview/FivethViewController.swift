//
//  FivethViewController.swift
//  tabview
//
//  Created by HTS-MAC on 13/01/25.
//

import UIKit

class FivethViewController: UIViewController {

    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.frame = CGRect(x: 250, y: 400, width: 100, height: 100)
        self.view.addSubview(imageView)
        
        UIView.animate(withDuration: 1, delay: 0.5, options: [.autoreverse, .repeat], animations: {
            self.imageView.image = UIImage(named: "apple")
            self.imageView.frame.origin.y -= 50
        })
        // Do any additional setup after loading the view.
    }

   

}
