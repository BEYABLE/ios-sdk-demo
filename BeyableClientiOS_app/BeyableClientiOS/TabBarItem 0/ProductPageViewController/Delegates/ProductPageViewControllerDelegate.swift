//
//  ProductPageViewControllerDelegate.swift
//
//
//  Created by Brahim Ouamassi
//


// ProductPageViewController Delegate
protocol ProductPageViewControllerDelegate: AnyObject {
  
  func didTapAddToCartButtonFromProductPage(
    for product: Product)
  
}

