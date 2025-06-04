//
//  FirstViewController.swift
//  tabview
//
//  Created by HTS-MAC on 09/01/25.
//

import UIKit

class FirstViewController: UIViewController {

    
    var imageView = UIImageView(image: UIImage(systemName: "heart.fill"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.frame = CGRect(x: 0,y: 0, width: 200, height: 200)
        imageView.clipsToBounds = true
        imageView.tintColor = .systemRed
        imageView.contentMode = .scaleAspectFill
        imageView.center = view.center
        view.addSubview(imageView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)

    {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 20, initialSpringVelocity: 0.5){
    self.imageView.transform = self.imageView.transform.scaledBy(x: 1.2, y: 1.2)
    self.view.layoutIfNeeded()
    }
    completion: { (_) in
    UIView.animate(withDuration: 0.5) {
    self.imageView.transform = .identity
    self.view.layoutIfNeeded()
    
    } completion: { _ in
    
    }
    }
    
    }

}
