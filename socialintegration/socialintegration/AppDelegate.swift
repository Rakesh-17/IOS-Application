//
//  AppDelegate.swift
//  socialintegration
//
//  Created by HTS-MAC on 05/03/25.
//
import GoogleSignIn
import UIKit
import FirebaseCore
import FacebookCore


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) ->
        Bool {
            
            ApplicationDelegate.shared.application(
                application,
                didFinishLaunchingWithOptions: launchOptions
            )
            let config = GIDConfiguration(clientID: "420186562501-h3eftb3141emgsg2kqikh1ni15l5e04e.apps.googleusercontent.com")

            GIDSignIn.sharedInstance.configuration = config
            
            FirebaseApp.configure()
            self.setintialvc()
          
          return true
        }
    
    
    func setintialvc(){
        let rootViewController = ViewController()
          let navigationController = UINavigationController(rootViewController: rootViewController)
          self.window = UIWindow(frame: UIScreen.main.bounds)
          self.window?.rootViewController = navigationController
          self.window?.makeKeyAndVisible()
    }
   
    func application(_ app: UIApplication, open url: URL,
              options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
      var handled: Bool

      handled = GIDSignIn.sharedInstance.handle(url)
      if handled {
        return true
      }

      
      return false
    }

    // MARK: UISceneSession Lifecycle

    


}

