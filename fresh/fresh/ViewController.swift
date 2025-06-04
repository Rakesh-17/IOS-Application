//
//  ViewController.swift
//  fresh
//
//  Created by HTS-MAC on 24/01/25.
//

import UIKit

class ViewController: UIViewController {

    let tabBarCnt = UITabBarController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        createTabBarController()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }


    func createTabBarController() {
           
        tabBarCnt.tabBar.tintColor = .blue

        
               let firstVc = FirstViewController()
        
               firstVc.tabBarItem = UITabBarItem.init(title: "Asset", image: UIImage(systemName: "homekit"), tag: 0)
               
               let secondVc = SecondViewController()
               secondVc.tabBarItem = UITabBarItem.init(title: "Webview", image: UIImage(systemName: "safari"), tag: 1)
        
           let ThirdVc = ThirdViewController()
        ThirdVc.tabBarItem = UITabBarItem.init(title: "PopUp", image: UIImage(systemName: "append.page.rtl"), tag: 2)
        
        let fourthVc = FourthViewController()
     fourthVc.tabBarItem = UITabBarItem.init(title: "Font", image: UIImage(systemName: "pencil.and.scribble"), tag: 3)
        
        let fifthVc = FifthViewController()
     fifthVc.tabBarItem = UITabBarItem.init(title: "Page View", image: UIImage(systemName: "arrow.right.page.on.clipboard"), tag: 4)
                
        let controllerArray = [firstVc,secondVc,ThirdVc,fourthVc,fifthVc]
                
                
               //tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
        
        tabBarCnt.viewControllers = controllerArray.map{UINavigationController.init(rootViewController: $0)}
               
        self.view.addSubview(tabBarCnt.view)
    
        tabBarCnt.tabBar.backgroundColor = .gray
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
