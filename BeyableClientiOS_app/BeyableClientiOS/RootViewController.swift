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
        let currentUser = BYVisitorInfos(isConnectedToAccount: true, isClient: true, pseudoId: "user_981234", favoriteCategory: "")
        AppDelegate.instance.beyableClient.setVisitorInfos(visitorInfos: currentUser)
        self.performSegue(withIdentifier: "showTab", sender: nil)
    }
    
    @IBAction
    func clickVisitor(){
        let currentUser = BYVisitorInfos(isConnectedToAccount: false, isClient: false, pseudoId: "", favoriteCategory: "")
        AppDelegate.instance.beyableClient.setVisitorInfos(visitorInfos: currentUser)
        self.performSegue(withIdentifier: "showTab", sender: nil)
    }
}
