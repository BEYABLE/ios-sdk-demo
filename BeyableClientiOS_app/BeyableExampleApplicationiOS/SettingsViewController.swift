//
//  SettingsViewController.swift
//  BeyableExampleApplicationiOS
//
//  Created by Ouamassi Brahim on 20/02/2024.
//
import UIKit
import Foundation
import BeyableClient
class SettingsViewController : UIViewController {
    @IBOutlet var switchProd : UISwitch?
    @IBOutlet var apiKeyField : UITextField?
    
    override func viewDidLoad() {
        
        let apiKey = SettingsHelper.getData(type: String.self, forKey: KeySettings.apiKey)
        let env = SettingsHelper.getData(type: String.self, forKey: KeySettings.environment)
        
        switchProd?.isOn = (env == EnvironmentBeyable.production.rawValue)
        apiKeyField?.text = apiKey
        switchProd?.addTarget(self, action: #selector(onSwitchValueChanged), for: .valueChanged)
        
        apiKeyField?.addTarget(self, action: #selector(yourHandler(textField:)), for: .editingChanged)
    }
    @objc func onSwitchValueChanged(_ s: UISwitch) {
        if(s.isOn){
            SettingsHelper.setData(value: EnvironmentBeyable.production.rawValue, key: KeySettings.environment )
        }
        else{
                SettingsHelper.setData(value: EnvironmentBeyable.preprod.rawValue, key: KeySettings.environment )
            }
        
        AppDelegate.instance.setBeyableClient()
        }
    
    @objc final private func yourHandler(textField: UITextField) {
        SettingsHelper.setData(value: textField.text, key: KeySettings.apiKey )
        
        AppDelegate.instance.setBeyableClient()
    }
    
    
}
