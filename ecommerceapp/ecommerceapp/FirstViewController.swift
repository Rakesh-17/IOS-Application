//
//  FirstViewController.swift
//  ecommerceapp
//
//  Created by HTS-MAC on 15/04/25.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var CottenMenSlimFitprice: UILabel!
    @IBOutlet weak var CottenMenSlimFitname: UILabel!
    @IBOutlet weak var CottenMenSlimFitimage: UIImageView!
    @IBOutlet weak var Oneplus9Rprice: UILabel!
    @IBOutlet weak var Oneplus9Rimage: UIImageView!
    @IBOutlet weak var Oneplus9Rname: UILabel!
    @IBOutlet weak var SamsungS24price: UILabel!
    @IBOutlet weak var SamsungS24name: UILabel!
    @IBOutlet weak var MenCheckeredCasualShirtprice: UILabel!
    @IBOutlet weak var SamsungS24image: UIImageView!
    @IBOutlet weak var Iphone16eprice: UILabel!
    @IBOutlet weak var Iphone16ename: UILabel!
    @IBOutlet weak var MenCheckeredCasualShirtimage: UIImageView!
    @IBOutlet weak var MenCheckeredCasualShirtname: UILabel!
    @IBOutlet weak var Iphone16eimage: UIImageView!
    @IBOutlet weak var menselfdesignformalshirtprice: UILabel!
    @IBOutlet weak var menselfdesignformalshirtname: UILabel!
    @IBOutlet weak var menselfdesignformalshirtimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func FIRSTVIEWALLCLICKED(_ sender: Any) {
        let nextVC = DetailedViewController()
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    @IBAction func menselfdesignformalshirtbuttonclicked(_ sender: Any) {
        
        let nextVC = DetailedViewController()
        nextVC.receievedproductimage = menselfdesignformalshirtimage.image
        nextVC.receivedproductname = menselfdesignformalshirtname.text
        nextVC.receivedproductprice = menselfdesignformalshirtprice.text
        nextVC.receivedproductdescription = menselfdesignformalshirtname.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
        
    }
    @IBAction func MenCheckeredCasualShirtBTCLICKED(_ sender: Any) {
        let nextVC = DetailedViewController()
        nextVC.receievedproductimage = MenCheckeredCasualShirtimage.image
        nextVC.receivedproductname = MenCheckeredCasualShirtname.text
        nextVC.receivedproductprice = MenCheckeredCasualShirtprice.text
        nextVC.receivedproductdescription = MenCheckeredCasualShirtname.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    @IBAction func Oneplus9RBTCLICKED(_ sender: Any) {
        let nextVC = DetailedViewController()
        nextVC.receievedproductimage = Oneplus9Rimage.image
        nextVC.receivedproductname = Oneplus9Rname.text
        nextVC.receivedproductprice = Oneplus9Rprice.text
        nextVC.receivedproductdescription = Oneplus9Rname.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    @IBAction func SamsungS24BTCLICKED(_ sender: Any) {
        let nextVC = DetailedViewController()
        nextVC.receievedproductimage = SamsungS24image.image
        nextVC.receivedproductname = SamsungS24name.text
        nextVC.receivedproductprice = SamsungS24price.text
        nextVC.receivedproductdescription = SamsungS24name.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    @IBAction func Iphone16eBTCLICKED(_ sender: Any) {
        let nextVC = DetailedViewController()
        nextVC.receievedproductimage = Iphone16eimage.image
        nextVC.receivedproductname = Iphone16ename.text
        nextVC.receivedproductprice = Iphone16eprice.text
        nextVC.receivedproductdescription = Iphone16ename.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    @IBAction func CottenMensSlimFitBTCLICKED(_ sender: Any) {
        let nextVC = DetailedViewController()
        nextVC.receievedproductimage = CottenMenSlimFitimage.image
        nextVC.receivedproductname = CottenMenSlimFitname.text
        nextVC.receivedproductprice = CottenMenSlimFitprice.text
        nextVC.receivedproductdescription = CottenMenSlimFitname.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
     @IBAction func SECONDVIEWALLBTCLICKED(_ sender: Any) {
         let nextVC = DetailedViewController()
         
         nextVC.modalPresentationStyle = .fullScreen
         self.present(nextVC, animated: true)
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
