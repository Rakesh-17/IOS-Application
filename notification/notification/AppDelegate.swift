//
//  AppDelegate.swift
//  notification
//
//  Created by HTS-MAC on 26/02/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {
    
    
    
    // Show notification when app is in foreground
    func userNotificationCenter(_ _center : UNUserNotificationCenter,
                                 willPresent notification: UNNotification, withCompletionHandler
                                completionHandler: @escaping
                                (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }


    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().delegate = self

        // Step 2: Set the initial view controller
        let homeViewController = mainViewController()
        // Step 3: Wrap it in a UINavigationController
        let navigationController = UINavigationController(rootViewController: homeViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible() // Make the window visible
        return true

    }
   /*/ func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
          let userInfo = response.notification.request.content.userInfo
          let title = response.notification.request.content.title
          let message = response.notification.request.content.body
          
          // Navigate to a new view controller to display the notification details
          if let window = self.window, let rootViewController = window.rootViewController {
              let notificationVC = NotificationPageViewController()
              notificationVC.notificationTitle = title
              notificationVC.notificationMessage = message
              rootViewController.present(notificationVC, animated: true, completion: nil)
          }
          
          completionHandler()
      }*/
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

