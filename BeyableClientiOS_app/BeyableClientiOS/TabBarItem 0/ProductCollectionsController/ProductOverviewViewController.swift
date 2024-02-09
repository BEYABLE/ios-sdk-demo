/*
 ProductOverviewViewController.swift
 
 Created by Brahim Ouamassi
 
 This ViewController shows the product collections by type
 */

import UIKit
import BeyableClient

class ProductOverviewViewController: UIViewController {

  
  // MARK: - Properties
  
  var screenTitle = "Categories"
  
  // Delegate
  weak var productOverviewViewControllerDelegate: ProductOverviewViewControllerDelegate?
  
  // Segue Identifiers
  let productCatalogSegue = "ProductCatalogViewControllerSegue"
  
  // Collection View
  @IBOutlet weak var productCollectionsList: UICollectionView!
  let productCollectionCellID = "ProductCollectionCell"
  
  // Products Data
  var productCollections: [ProductCollection] = []
  var userTappedProductCollection: [Product] = []
  var userTappedProductCollectionName = ""
  
  // Image Loader
  var imageLoader: ImageDownloader?
  
  
  // MARK: - View Controller's Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
      self.title = screenTitle
    // NavigationBar
    setupNavigationBar()

    // Product Collections CollectionView setup
    ObjectCollectionHelper.setupCollectionView(
      productCollectionCellID,
      for: productCollectionsList, in: self)
    
      
      let homePage = BYHomeAttributes(tags: ["screenTitle":"\(self.screenTitle)", "numberCategory":"\(self.productCollections.count)"])
      
      AppDelegate.instance.beyableClient.sendPageview(page: EPageUrlTypeBeyable.HOME, currentViewController: self, attributes: homePage)

      
    
  }
  
  
  // MARK: - View transition
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    
    productCollectionsList.reloadData()
    
    /*
     Allow the large title in the navigationBar to go back
     to normal size on the view's transition to portrait orientation
    */
    coordinator.animate { (_) in
      self.navigationController?.navigationBar.sizeToFit()
    }
  }
   
  
  // MARK: - Navigation
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    // Pass data to ProductCatalogViewController
    if segue.identifier == productCatalogSegue {
      
      let viewController = segue.destination as! ProductCatalogViewController
      viewController.productList = userTappedProductCollection
      viewController.collectionName = userTappedProductCollectionName
      viewController.imageLoader = imageLoader
      viewController.backButtonTitle = screenTitle
      viewController.productCatalogViewControllerDelegate = self
    }
  }
  
}


// MARK: - Setup UI

extension ProductOverviewViewController {
  
  func setupNavigationBar() {
  }
  
}


