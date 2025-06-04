//
//  SecondViewController.swift
//  allinone
//
//  Created by HTS-MAC on 23/01/25.
//

import UIKit

class SecondViewController: UIViewController {

   
    
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(image)
    }


    @IBAction func template(_ sender: Any) {
        let timage = UIImage(named: "google")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor(named: "myColor")
        image.image = timage
        
    }
    @IBAction func normal(_ sender: Any) {
        let nimage = UIImage(named: "google")
        
        image.image = nimage
    }
    @IBAction func back(_ sender: Any) {
            present(ViewController(), animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
