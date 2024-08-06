//
//  AppDelegate.swift
//
//
//  Created by Brahim Ouamassi
//

import UIKit
import BeyableSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    static private(set) var instance: AppDelegate! = nil
    var beyableClient : BeyableSDK!
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppDelegate.instance = self
        
        setBeyableClient()
        return true
    }
    
    public func setBeyableClient(){
        var token = SettingsHelper.getData(type: String.self, forKey: KeySettings.apiKey)
        var env = SettingsHelper.getData(type: String.self, forKey: KeySettings.environment)
        if(token == nil || env == nil){
            token = "aaaaaaaaad265554b8b4b4417aa14660411b1e83c"
            env = EnvironmentBeyable.preprod.rawValue
        }

        beyableClient = BeyableSDK(tokenClient: token!, environment: SettingsHelper.getEnvByString(envString: env ?? EnvironmentBeyable.production.rawValue), loggingEnabledUser: true)
    }
    
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    
}

