# BEYABLE-sdk-mobile-ios-app-uikit-example
 App démo iOS avec UIKIT pour le SDK mobile iOS Beyable
 
Ajouter la ligne suivante à fichier pod
```
pod 'BeyableClient'
```

## Intégration

Avant tout apelle à le SDK,il est nécessaire initialisé avec les clefs fournie par BeYable

```
    let beyableClient = BeyableClientiOS(tokenClient: "aaaaaaaa********", environment: .prod, loggingEnabledUser: true)
```

## Usage
À chaque affichage d'une vue, on informe le SDK.</br>
Faire bien attention à appeller l'instance Beyable après la vue afficher (pour que le SDK puisse étudier l'affichage),
par exemple, dans le cas d'un Fragment.
### Example Page 'Home'
```
      let homePage = BYHomeAttributes(tags: ["screenTitle":"\(self.screenTitle)", "numberCategory":"\(self.productCollections.count)"])
      
      AppDelegate.instance.beyableClient.sendPageview(page: EPageUrlTypeBeyable.HOME, currentView: self.view, attributes: homePage)
```
## Example page ViewController produit 
```
     let productBY : BYProductAttributes = BYProductAttributes(reference: productObject?.id, name: productObject?.name, url: productObject?.imageUrl, priceBeforeDiscount: productObject?.price.value ?? 0.0, sellingPrice: productObject?.price.value ?? 0, stock: 1, thumbnailUrl: "", tags: ["type":"\(productObject?.type ?? "")","materiel":"\(productObject?.info?.material ?? "")"])
      AppDelegate.instance.beyableClient.sendPageview(page: EPageUrlTypeBeyable.PRODUCT, currentView: self.view, attributes: productBY)
```
## Affichage des campagnes 

### Modal Overlay View 
### Header : Sticky Banner 
#### InPage - Replace
Pour le remplacement, il faut que les vues soient identifiés avec un accessibilityIdentifier.</br>
La vue remplacée doit être enfant d'un UiStackView
#### InPage - Positionné
Pour une vue positionné, il est nécessaire d'avoir les vues identifiées avec accessibilityIdentifier.</br>
La vue parent de la vue seléctionnée doît être un UIStackView pour permettre
les règles de positionnement.



# MVC, Core Data, Notification Center, UIKit & XCTest



This app contains:

* A UITabBarController where the app is embedded into.
* 2 UINavigationControllers
* 4 UIViewControllers
* 1 Storyboard
* 1 Launchscreen
* XCTests 
* Assets (App icon, buttons and 1 launchscreen image)

<br>
<hr>
<br>

## Root Controller -> UITabBarController:

* This View Controller has 2 child UINavigationControllers which produce 2 TabBarItems.
* Delegate for ProductOverviewViewController and CartViewController.
* It handles getting the product objects from the JSON file to be used through out the app.
* It handles Shopping Cart data storage in CoreData.

<br>

<img src="Assets/Clips/Shopping_App_iOS.gif" width ="300">

<br>


## TabBarItem 1 - View Controller Stack:

# 1. Top View Controller -> ProductOverviewViewController:

* Organizes the products into collections of the same type of product.
* Displays the collections on a UICollectionView.
* Delegate for ProductCatalogViewController.
* Contains a segue to ProductCatalogViewController.

# 2. ProductCatalogViewController:

* Receives the product list from a user-selected collection type.
* Displays the list of products on a UICollectionView.
* Can add a product to the Shopping Cart from each UICollectionViewCell.
* Delegate for ProductPageViewController.
* Contains a segue to ProductPageViewController.

# 3. ProductPageViewController:

* Receives a single user-selected product.
* Displays the product's information inside a UIScrollView.
* Can add the product to the Shopping Cart from the Add To Cart button.

<br>
<hr>
<br>

## TabBarItem 2:

# Top View Controller -> CartViewController:

* Sets up an observer to update its Shopping Cart data and UI when ProductCatalogViewController and ProductPageViewController add a new product to the Shopping Cart.
* Displays the products from the Shopping Cart on a UITableView.
* The user can change the quantity of each product (+ || -) through a UIPickerView.
* The user can remove each product from the Shopping Cart.
* The total price of all the products in the Shopping Cart is always visible to the user at the bottom of the screen.

<br>
<hr>
<br>

# Other features:

* The UI adapts to light and dark modes.







