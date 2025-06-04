//
//  ViewController.swift
//  animation
//
//  Created by HTS-MAC on 07/01/25.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView = UIImageView(image: UIImage(systemName: "heart.fill"))
    var imageView1 = UIImageView(image: UIImage(systemName: "eye"))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        imageView1.frame = CGRect(x: 0,y: 0, width: 200, height: 200)
        imageView1.clipsToBounds = true
        imageView1.tintColor = .systemRed
        imageView1.contentMode = .scaleAspectFill
        imageView1.center = view.center
        view.addSubview(imageView1)
        
        animateWink()
        // Do any additional setup after loading the view.
    }
    
    func animateWink() {
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
        
        
        
        /* UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 20  , initialSpringVelocity: 0.5 )
         {
         self.imageView.transform = self.imageView.transform.scaledBy(x: 1.2, y: 1.2)
         self.view.layoutIfNeeded()
         }
         completion: { (_) in
         UIView.animate(withDuration: 0.5, animations: {
         self.imageView.transform = .identity
         self.view.layoutIfNeeded()
         
         }, completion: { _ in
         
         })
         }
         }*/
        
    }
}
