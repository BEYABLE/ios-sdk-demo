//
//  RootViewController.swift
//  ShoppableApp
//
//  Created by Ouamassi Brahim on 07/02/2024.
//

import Foundation
import UIKit
import BeyableClient

class RootViewController: UIViewController {
    override func viewDidLoad() {
    }
    
    @IBAction
    func clickLogin(){
        AppDelegate.instance.beyableClient.setUserInfos(userInfos: UserInfos(isConnectedToAccount: true, isClient: true, pseudoId: "user_981234", favoriteCategory: nil))
        self.performSegue(withIdentifier: "showTab", sender: nil)
    }
    
    @IBAction
    func clickVisitor(){
        AppDelegate.instance.beyableClient.setUserInfos()
        self.performSegue(withIdentifier: "showTab", sender: nil)
    }
}
