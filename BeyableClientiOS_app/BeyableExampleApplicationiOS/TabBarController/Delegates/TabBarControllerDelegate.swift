//
//  TabBarControllerDelegate.swift
//
//  Created by Brahim Ouamassi
//


import UIKit


// UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
  
    // MARK: - User tapped on TabBarItem
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedTabIndex = tabBarController.selectedIndex    
        if selectedTabIndex != currentTabIndex {
            currentTabIndex = selectedTabIndex
            let navController = viewController as! UINavigationController
            let viewController = navController.topViewController
      
            // Update data in a tapped tabBar View Controller
            switch selectedTabIndex {
            case 2:
                if let currentController = viewController as? CartViewController {
                    currentController.shoppingCartProducts = shoppingCartProducts
                }
            case 1:
                if let currentController = viewController as? SwiftUIViewController {
                    var products = [Product]()
                    for collection in self.productCollections {
                        products.append(contentsOf: collection.products)
                    }
                    currentController.products = products
                }
            default:
                print("Collections Tab")
            }
        }
    }
}













