//
//  AppDelegate.swift
//  
//
//  Created by Brahim Ouamassi
//

import UIKit
import BeyableClient
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    static private(set) var instance: AppDelegate! = nil
    let beyableClient = BeyableClient(tokenClient: "aaaaaaaaa2703cf6e44624d9b81f15f14893d1d6a", loggingEnabledUser: true)
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
          AppDelegate.instance = self

    return true
  }

  // MARK: UISceneSession Lifecycle
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
   
  }
    
  
}

