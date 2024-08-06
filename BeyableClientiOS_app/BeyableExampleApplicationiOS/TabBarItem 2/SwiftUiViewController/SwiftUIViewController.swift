//
//  SwiftUIViewController.swift
//  BeyableExampleApplicationiOS
//
//  Created by MarKinho on 30/07/2024.
//

import UIKit
import SwiftUI
import BeyableSDK

class SwiftUIViewController: UIViewController   {
        
    // MARK: - Properties
    var products: [Product] = []
    
     // MARK: - View Controller's Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Vérifiez la configuration de la Navigation Bar ici
        self.navigationController?.navigationBar.prefersLargeTitles = false
        UINavigationBar.appearance().largeTitleTextAttributes = nil
        UINavigationBar.appearance().titleTextAttributes = nil
        UINavigationBar.appearance().frame.size.height = 44 // Hauteur par défaut de la barre de navigation
        
        let swiftUIView = ProductsCollectionPageView(products: products)
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        // Ajoutez le UIHostingController comme un enfant
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // Configurez les contraintes pour occuper toute la vue
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        hostingController.didMove(toParent: self)       
    }
    
}
