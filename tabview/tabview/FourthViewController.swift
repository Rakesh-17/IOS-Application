//
//  FourthViewController.swift
//  tabview
//
//  Created by HTS-MAC on 13/01/25.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UIView.animate(withDuration: 5, animations: {
            self.view.backgroundColor = .systemBlue
        } , completion : nil )
        // Do any additional setup after loading the view.
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
