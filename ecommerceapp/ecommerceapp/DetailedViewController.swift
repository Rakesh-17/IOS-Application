//
//  DetailedViewController.swift
//  ecommerceapp
//
//  Created by HTS-MAC on 18/04/25.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var crview: UIView!
    @IBOutlet weak var displayproductdescription: UILabel!
    @IBOutlet weak var displayproductprice: UILabel!
    @IBOutlet weak var displayproductname: UILabel!
    @IBOutlet weak var displayImageview: UIImageView!
    
    
    var receievedproductimage: UIImage?
    var receivedproductname: String?
    var receivedproductprice: String?
    var receivedproductdescription: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        crview.layer.cornerRadius = crview.frame.height/2

        displayImageview.image = receievedproductimage
        displayproductname.text = receivedproductname
        displayproductprice.text = receivedproductprice
        displayproductdescription.text = receivedproductdescription
        // Do any additional setup after loading the view.
    }

    @IBAction func backbtclicked(_ sender: Any) {
        let nextVC = HomeViewController()
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    

}
