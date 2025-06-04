//
//  HomeViewController.swift
//  ecommerceapp
//
//  Created by HTS-MAC on 14/04/25.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tabbar: UITabBar!
    let tabBarCnt = UITabBarController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        createTabBarController()
        // Do any additional setup after loading the view.
    }


    func createTabBarController() {
           
        
               let firstVc = FirstViewController()
               
               firstVc.tabBarItem = UITabBarItem.init(title: "", image: UIImage(systemName: "homekit"), tag: 0)
               
               let secondVc = SecondViewController()
               secondVc.tabBarItem = UITabBarItem.init(title: "", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
           let ThirdVc = ThirdViewController()
        ThirdVc.tabBarItem = UITabBarItem.init(title: "", image: UIImage(systemName: "heart"), tag: 2)
        
        let fourthVc = FourthViewController()
     fourthVc.tabBarItem = UITabBarItem.init(title: "", image: UIImage(systemName: "stroller"), tag: 3)
        
       // let fivethVc = FivethViewController()
   //  fivethVc.tabBarItem = UITabBarItem.init(title: "Search", image: UIImage(systemName: //"eraser"), tag: 4)
     
        let sixthVc = FivethViewController()
     sixthVc.tabBarItem = UITabBarItem.init(title: "", image: UIImage(systemName: "person"), tag: 4)
                
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
