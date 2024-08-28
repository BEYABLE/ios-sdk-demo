/*
 ProductCatalogViewController.swift
 
 
 Created by Brahim Ouamassi
 
 Display the product list of a single type in a CollectionView
 */

import UIKit
import Foundation

import BeyableSDK

class ProductCatalogViewController: UIViewController {
    
    // MARK: - Properties
    
    // Delegate
    weak var productCatalogViewControllerDelegate: ProductCatalogViewControllerDelegate?
    
    // ProductPageViewController
    let productPageViewControllerSegue = "ProductPageViewControllerSegue"
    var userTappedProductObj: Product?
    
    // Observer Names
    let updateShoppingCartObserverName = "updateShoppingCartObserver"
    
    // Title
    var collectionName = ""
    var backButtonTitle = ""
    
    // Product Catalog
    var productList: [Product] = []
    
    // Products Collection View
    @IBOutlet weak var productCatalogCollectionView: UICollectionView!
    var productCellID = "ProductCatalogCell"
    
    // Image Loader
    var imageLoader: ImageDownloader?
    
    
    // MARK: - View Controller's Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Navigation Bar
        setupNavigationBar()
        
        // Setup the Product Catalog Collection View
        ObjectCollectionHelper.setupCollectionView(
            productCellID,
            for: productCatalogCollectionView, in: self)
        
        var category = BYCategoryAttributes(
            CategoryId: "", CategoryName: collectionName, tags: ["Number_Product:\(productList.count)", "backButtonTitle: \(backButtonTitle)"])
        category.contextData = [
            "magasin": "Carrefour Market",
            "magasin_size": "1234"
        ]
        AppDelegate.instance.beyableClient.sendPageview(
            url: "/products_collection_uikit",
            page: EPageUrlTypeBeyable.CATEGORY,
            currentView: self.view,
            attributes: category, callback: nil)
        
    }
    
    
    // MARK: - ViewWillTransition
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        /*
         Reload the Products CollectionView to update
         its layout
         */
        productCatalogCollectionView.reloadData()
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Pass data for a product to ProductPageViewController
        if segue.identifier == productPageViewControllerSegue {
            
            let viewController = segue.destination as! ProductPageViewController
            viewController.productObject = userTappedProductObj
            viewController.imageLoader = imageLoader
            viewController.productPageViewControllerDelegate = self
        }
    }
    
}


// MARK: - Setup UI

extension ProductCatalogViewController {
    
    func setupNavigationBar() {
        title = collectionName
        navigationController?.navigationBar.topItem?
            .backButtonTitle = backButtonTitle
    }
    
}


// MARK: - Observers

extension ProductCatalogViewController {
    
    func postToUpdateShoppingCartObserver() {
        NotificationCenter.default.post(
            name: Notification.Name(updateShoppingCartObserverName),
            object: nil
        )
    }
    
}
