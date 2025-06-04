//
//  FirstcolorViewController.swift
//  fresh
//
//  Created by HTS-MAC on 28/01/25.
//

import UIKit

class FirstcolorViewController: UIViewController {

    @IBOutlet weak var btstack: UIStackView!
    @IBOutlet weak var colorview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        colorview.layer.borderColor = UIColor.black.cgColor
        colorview.layer.borderWidth = 2.0
        colorview.layer.masksToBounds = true
        view.addSubview(colorview)
        view.addSubview(btstack)
        self.navigationController?.isNavigationBarHidden = true
        
    }

    @IBAction func orangebtclicked(_ sender: Any) {
        colorview.backgroundColor = .orange
    }
    @IBAction func Greenbtclicked(_ sender: Any) {
        colorview.backgroundColor = .green

    }
    @IBAction func Bluebtclicked(_ sender: Any) {
        colorview.backgroundColor = .blue

    }
    @IBAction func Redbtclicked(_ sender: Any) {
        colorview.backgroundColor = .red

    }
    
    @IBAction func backclicked(_ sender: Any) {
        let fullScreenVC = ViewController()
        fullScreenVC.modalPresentationStyle = .fullScreen
        self.present(fullScreenVC, animated: true, completion: nil)
    }
    

}
