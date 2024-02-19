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
    let beyableClient = BeyableClientiOS(tokenClient: "aaaaaaaaad265554b8b4b4417aa14660411b1e83c", environment: .preprod, loggingEnabledUser: true)
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

