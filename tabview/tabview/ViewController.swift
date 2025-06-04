//
//  ViewController.swift
//  tabview
//
//  Created by HTS-MAC on 13/01/25.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    
    @IBOutlet weak var tabbar: UITabBar!
    let tabBarCnt = UITabBarController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        createTabBarController()
        // Do any additional setup after loading the view.
    }


    func createTabBarController() {
           
        
               let firstVc = FirstViewController()
               
               firstVc.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(systemName: "heart"), tag: 0)
               
               let secondVc = SecondViewController()
               secondVc.tabBarItem = UITabBarItem.init(title: "Search", image: UIImage(systemName: "eye"), tag: 1)
        
           let ThirdVc = ThirdViewController()
        secondVc.tabBarItem = UITabBarItem.init(title: "Search", image: UIImage(systemName: "pencil"), tag: 2)
        
        let fourthVc = FourthViewController()
     fourthVc.tabBarItem = UITabBarItem.init(title: "Search", image: UIImage(systemName: "trash"), tag: 3)
        
       // let fivethVc = FivethViewController()
   //  fivethVc.tabBarItem = UITabBarItem.init(title: "Search", image: UIImage(systemName: //"eraser"), tag: 4)
     
       let sixthVc = SixthViewController()
     sixthVc.tabBarItem = UITabBarItem.init(title: "lottie", image: UIImage(systemName: "pencil"), tag: 5)
                
        let controllerArray = [firstVc, secondVc, ThirdVc,fourthVc, sixthVc]
                
                
               tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
               
        self.view.addSubview(tabBarCnt.view)
    
        tabBarCnt.tabBar.backgroundColor = .white
        tabBarCnt.didMove(toParent: self)
        tabBarCnt.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tabBarCnt.view.topAnchor.constraint(equalTo: view.topAnchor),
            tabBarCnt.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarCnt.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarCnt.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        
        
           }

}
