//
//  ViewController.swift
//  amazon
//
//  Created by HTS-MAC on 28/04/25.
//

import UIKit

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
               
               firstVc.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
               
               let secondVc = SecondViewController()
               secondVc.tabBarItem = UITabBarItem.init(title: "You", image: UIImage(systemName: "person.crop.circle.fill"), tag: 1)
        
           let ThirdVc = ThirdViewController()
        ThirdVc.tabBarItem = UITabBarItem.init(title: "Cart", image: UIImage(systemName: "cart"), tag: 2)
        
        let fourthVc = FourthViewController()
     fourthVc.tabBarItem = UITabBarItem.init(title: "Menu", image: UIImage(systemName: "list.bullet"), tag: 3)
        
       // let fivethVc = FivethViewController()
   //  fivethVc.tabBarItem = UITabBarItem.init(title: "Search", image: UIImage(systemName: //"eraser"), tag: 4)
     
        let sixthVc = FivethViewController()
     sixthVc.tabBarItem = UITabBarItem.init(title: "Rufus", image: UIImage(systemName: "moon.stars"), tag: 4)
                
        let controllerArray = [firstVc, secondVc, ThirdVc,fourthVc, sixthVc]
                
                
               tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
               
        self.view.addSubview(tabBarCnt.view)
    
        tabBarCnt.tabBar.backgroundColor = .white
        tabBarCnt.tabBar.tintColor = .black
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

