//
//  ViewController.swift
//  ani2
//
//  Created by HTS-MAC on 08/01/25.
//

import UIKit

class ViewController: UIViewController {

         let subImageView = UIImageView()
     
    let imageView = UIImageView()
    
    override func viewWillAppear(_ animated: Bool) {
            self.imageView.image = UIImage(named: "google")
            subImageView.frame = self.imageView.frame
            subImageView.image = UIImage(named: "apple")
            subImageView.alpha = 0
            self.imageView.addSubview(subImageView)
        }
         override func viewDidAppear(_ animated: Bool) {
            
            UIView.animate(withDuration: 1, delay: 3,options: .autoreverse,  animations: {
                self.subImageView.alpha = 1.0
            }, completion: {_ in
                self.imageView.image = self.subImageView.image//UIImage(named: "apple")
                self.subImageView.removeFromSuperview()
            })
          }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.frame = CGRect(x: 30, y: 50, width: 100, height: 100)
        self.view.addSubview(imageView)
        // Do any additional setup after loading the view.
    }



}
