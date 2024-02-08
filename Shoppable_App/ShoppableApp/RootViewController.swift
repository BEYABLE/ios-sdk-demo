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
        let currentUser = UserInfos(isConnectedToAccount: true, isClient: true, pseudoId: "user_981234", favoriteCategory: "")
        AppDelegate.instance.beyableClient.setUserInfos(userInfos: currentUser)
        self.performSegue(withIdentifier: "showTab", sender: nil)
    }
    
    @IBAction
    func clickVisitor(){
        let currentUser = UserInfos(isConnectedToAccount: false, isClient: false, pseudoId: "", favoriteCategory: "")
        AppDelegate.instance.beyableClient.setUserInfos(userInfos: currentUser)
        self.performSegue(withIdentifier: "showTab", sender: nil)
    }
}
