//
//  ThirdViewController.swift
//  fresh
//
//  Created by HTS-MAC on 24/01/25.
//

import UIKit

class ThirdViewController: UIViewController, ThirdblurViewController.BlurVCDelegate {

   
    @IBOutlet public var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }


    @IBAction func Enterbt(_ sender: Any) {
//       var ThirdblurView = ThirdblurViewController()
//        ThirdblurView.mystring = name.text!
        
       
        let blurVC = ThirdblurViewController()
        blurVC.mystring = name.text!
        blurVC.modalPresentationStyle = .custom
    
        present(blurVC, animated: true, completion: nil)
        setBlurView()
    
       blurVC.delegate = self
    }
func setBlurView() {
    
    let blurView = UIVisualEffectView()
    
    blurView.frame = view.frame
    
    blurView.effect = UIBlurEffect(style: .regular)
    
    view.addSubview(blurView)
    
}
    func removeBlurView() {
        for subview in view.subviews {
            if subview.isKind(of: UIVisualEffectView.self) {
                subview.removeFromSuperview()
            }
        }
    }
    

}
