//
//  SecondViewController.swift
//  tabview
//
//  Created by HTS-MAC on 09/01/25.
//

import UIKit

class SecondViewController: UIViewController {
    
    var imageView1 = UIImageView(image: UIImage(systemName: "eye"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView1.frame = CGRect(x: 0,y: 0, width: 200, height: 200)
        imageView1.clipsToBounds = true
        imageView1.tintColor = .systemRed
        imageView1.contentMode = .scaleAspectFill
        imageView1.center = view.center
        view.addSubview(imageView1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        
        let originalHeight = imageView1.frame.size.height
        let originalYPos = imageView1.center.y
        
        UIView.animate(withDuration: 0.5, animations: {
            self.imageView1.frame.size.height = 0
            self.imageView1.center.y = 400
        }) { (true) in
            self.imageView1.frame.size.height = originalHeight
            self.imageView1.center.y = originalYPos
        }
        
    }
}
