//
//  AppDelegate.swift
//  allinone
//
//  Created by HTS-MAC on 23/01/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        // Step 2: Set the initial view controller
        let homeViewController = ViewController()
        // Step 3: Wrap it in a UINavigationController
        let navigationController = UINavigationController(rootViewController: homeViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible() // Make the window visible
        return true
    }

    // MARK: UISceneSession Lifecycle

   

}

