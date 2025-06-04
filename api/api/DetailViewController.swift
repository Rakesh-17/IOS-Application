//
//  DetailViewController.swift
//  api
//
//  Created by HTS-MAC on 13/02/25.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
   
    var imageName: String?
    @IBOutlet weak var imageview: UIImageView!
    var rownumber: Int?
    let vc = CollectionViewController()

       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .white
           self.navigationItem.setHidesBackButton(true, animated: false)
           let backbtclicked = UITapGestureRecognizer(target: self, action:#selector(backbtclicked(_:)))
           view.addGestureRecognizer(backbtclicked)
           if let imageName = imageName {
               imageview.sd_setImage(with: URL(string: imageName), placeholderImage: nil)
               
           }
       }
    @IBAction func backbtclicked(_ sender: Any) {
        print("back bt clicked")
        if(((rownumber!)%2) == 0)
        {
            print(rownumber as Any)
            self.navigationController?.popToRootViewController(animated: true)
        }
        else{
            print(rownumber as Any)
            dismiss(animated: true, completion: nil)
        }
    }
}
    
