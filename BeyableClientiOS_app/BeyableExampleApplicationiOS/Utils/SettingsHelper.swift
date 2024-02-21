//
//  SettingsHelper.swift
//
//
//  Created by Ouamassi Brahim on 27/01/2024.
//

import Foundation
import BeyableClient
///  A class that manages the saving of certain data in the shared preferences of the phone
class SettingsHelper {
    
    static func setData<T>(value: T, key: KeySettings) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key.rawValue)
    }
    static func getData<T>(type: T.Type, forKey: KeySettings) -> T? {
        let defaults = UserDefaults.standard
        let value = defaults.object(forKey: forKey.rawValue) as? T
        return value
    }
    static func removeData(key: KeySettings) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key.rawValue)
    }
    public static func getEnvByString(envString : String) -> EnvironmentBeyable{
        if(envString == EnvironmentBeyable.preprod.rawValue){
            return EnvironmentBeyable.preprod
        }
        else {
            return EnvironmentBeyable.production
        }
    }
}

///  List of keys that will be used to store data in the preferences.
enum KeySettings: String, CaseIterable {
    case apiKey
    case environment
}
