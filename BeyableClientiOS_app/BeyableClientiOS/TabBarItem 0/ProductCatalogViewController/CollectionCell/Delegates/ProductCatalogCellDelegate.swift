//
//  ProductCatalogCellDelegate.swift
//
//
//  Created by Brahim Ouamassi
//


// ProductCatalogCell Delegate
protocol ProductCatalogCellDelegate: AnyObject {
  
  func didTapAddToCartButton(
    fromProductCatalogCell cell: ProductCatalogCell)
  
}
