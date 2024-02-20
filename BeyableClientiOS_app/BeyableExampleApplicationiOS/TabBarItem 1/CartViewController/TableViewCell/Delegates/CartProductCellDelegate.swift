//
//  CartProductCellDelegate.swift
//  
//
//  Created by Brahim Ouamassi
//


// CartProductCell Delegate

protocol CartProductCellDelegate: AnyObject {
  
  func didRemoveItemFromShoppingCart(from cell: CartProductCell)
  
  func didTapChangeQuantityButton(from cell: CartProductCell)
  
}
