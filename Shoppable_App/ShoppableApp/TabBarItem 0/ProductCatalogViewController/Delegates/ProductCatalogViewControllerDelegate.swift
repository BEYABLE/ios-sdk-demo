//
//  ProductCatalogViewControllerDelegate.swift
//
//
//  Created by Brahim Ouamassi
//


// ProductCatalogViewController Delegate
protocol ProductCatalogViewControllerDelegate: AnyObject {
  
  func didTapAddToCartButtonFromProductCatalogController(
    for product: Product)
  
}
