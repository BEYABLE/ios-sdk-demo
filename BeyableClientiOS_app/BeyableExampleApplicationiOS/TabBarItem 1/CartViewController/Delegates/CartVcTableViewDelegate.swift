//
//  CartVcTableViewDelegate.swift
//
//
//  Created by Brahim Ouamassi
//

import UIKit
import BeyableSDK


// UITableViewDelegate, UITableViewDataSource

extension CartViewController: UITableViewDelegate, UITableViewDataSource, OnCtaDelegate {
    
  
    // MARK: - Sections
    // 1 section
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
    // MARK: - Items in section
    // All products in the Shopping Cart in 1 section
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCartProducts.count
    }
  
    
    // MARK: - cellForRowAt
    // Load the Product Cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: shoppingCartCellID, for: indexPath) as! CartProductCell
        
        let index = indexPath.row
        // Become the cell's delegate
        cell.cartProductCellDelegate = self
        // Product to load in the current cell
        let product = shoppingCartProducts[index]
        // Add the name of the product
        cell.productNameLabel.attributedText = ProductAttributedStringHelper.getAttributedName(from: product.name!, withSize: 18)
        // Add the product count the ShoppingCart
        let inShoppingCartCount = Int(product.count)
        cell.changeQuantityButton.text = "\(inShoppingCartCount)"
        cell.itemCountInShoppingCart = inShoppingCartCount
        
        // Add the price of the product
        let price = product.price
        let multipliedPriceValue = price.byItemCount(inShoppingCartCount)
        cell.productPriceLabel.text = multipliedPriceValue.toCurrencyFormat()
        
        /*
         Load the image of the product from a URL
         */
        if let imageURL = ProductInfoHelper.canCreateImageUrl(from: product.imgUrl) {
            // Attempt to load image
            let token = imageLoader?.loadImage(imageURL) {
                result in do {
                    let image = try result.get()
                    // The UI must be accessed through the main thread
                    DispatchQueue.main.async {
                        cell.productImageView.image = image
                    }
                } catch {
                    print("ERROR loading image with error: \(error.localizedDescription)!")
                }
            }
            
            /*
             When the cell is being reused, cancel loading the image.
             Use [unowned self] to avoid retention of self
             in the cell's onReuse() closure.
             */
            cell.onReuse = { [unowned self] in
                if let token = token {
                    self.imageLoader?.cancelImageDownload(token)
                }
            }
        }
        
        return cell
    }
    
    // Delegate methods
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let index = indexPath.row
        // Product to load in the current cell
        let product = shoppingCartProducts[index]
        // Send the cell to the BeyableSDK
        AppDelegate.instance.beyableClient.sendCellBinded(url: "/cart", cell: cell, elementId: product.name!, callback: self)
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Réinitialisez l'état de la cellule lorsqu'elle est retirée de l'écran
        let index = indexPath.row
        let product = shoppingCartProducts[index]
        AppDelegate.instance.beyableClient.sendCellUnbinded(url: "/cart", cell: cell, elementId: product.name!)
    }
    
    func onBYClick(cellId: String, value: String) {
        NSLog("Campaing clicked for cell \(cellId) with value \(value)")
    }
    
    
    
    // MARK: - Swipe Left on Cell
    // Swipe left to display "Delete" product button
  
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let removeItemAction = UIContextualAction(style: .normal, title: "") { action, sourceView, completionHandler in
            self.removeItemFromShoppingCart(from: indexPath.row)
            completionHandler(true)
        }
        
        removeItemAction.backgroundColor = .red
        removeItemAction.image = UIImage(systemName: "xmark")
    
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [removeItemAction])
        return swipeConfiguration
    }
  
  
    
    
    // MARK: - Cell Height
    // Set the cell's height
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
    // MARK: - Cell was tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cartProduct = shoppingCartProducts[indexPath.row]
        userTappedProductObj = Product(id: cartProduct.id!, name: cartProduct.name!, description: cartProduct.description,
                                       price: Price(value: cartProduct.price, currency: "€"),
                                       info: Info(material: "Material", numberOfSeats: 2, color: "Red", dimensions: "", weight: "", bulbType: ""),
                                       type: cartProduct.type!, imageUrl: cartProduct.imgUrl!,
                                       isFavorite: true, rating: 4, availability: "yes", userReviews: [])
        
        // Go to ProductPageViewController
        performSegue(withIdentifier: productPageViewControllerSegue, sender: self)
    }
    
    

}
