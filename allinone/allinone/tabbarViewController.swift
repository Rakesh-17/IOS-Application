//
//  tabbarViewController.swift
//  allinone
//
//  Created by HTS-MAC on 23/01/25.
//

import UIKit

class tabbarViewController: UIViewController {

    let tabBarCnt = UITabBarController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        createTabBarController()
        // Do any additional setup after loading the view.
    }


    func createTabBarController() {
           
        tabBarCnt.tabBar.tintColor = .white
               let firstVc = FirstViewController()
        
               firstVc.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(systemName: "bell"), tag: 0)
               
               let secondVc = SecondViewController()
               secondVc.tabBarItem = UITabBarItem.init(title: "Search", image: UIImage(systemName: "eye"), tag: 1)
        
           let ThirdVc = ThirdViewController()
        ThirdVc.tabBarItem = UITabBarItem.init(title: "Search", image: UIImage(systemName: "pencil"), tag: 2)
        
        let fourthVc = FourthViewController()
     fourthVc.tabBarItem = UITabBarItem.init(title: "Search", image: UIImage(systemName: "trash"), tag: 3)
        
       
                
        let controllerArray = [firstVc,secondVc,ThirdVc,fourthVc]
                
                
               //tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
        
        tabBarCnt.viewControllers = controllerArray.map{UINavigationController.init(rootViewController: $0)}
               
        self.view.addSubview(tabBarCnt.view)
    
        tabBarCnt.tabBar.backgroundColor = .black
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

