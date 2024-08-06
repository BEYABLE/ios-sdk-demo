/*
 ProductPageViewController.swift
 
 
 Created by Brahim Ouamassi
 
 Display the product the user tapped on
 in ProductCatalogViewController
 */

import UIKit
import BeyableSDK


class ProductPageViewController: UIViewController {

    // MARK: - Properties
    weak var productPageViewControllerDelegate: ProductPageViewControllerDelegate?
  
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var containerScrollView: UIScrollView!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
  
    var productObject: Product?
    var attributedCartButtonText: NSAttributedString?
    var imageLoader: ImageDownloader?
    var checkmark: CheckmarkView!
  
    // MARK: - View Controller's Life Cycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupContainerScrollView()
        setupUI()
        loadProductInfo()
        sendProductViewEventToBeyable()
    }
    
    // MARK: - Button Actions
  
    @IBAction func addToCartButtonAction(_ sender: UIButton) {
        if let product = productObject {
            productPageViewControllerDelegate?.didTapAddToCartButtonFromProductPage(for: product)
        }
    }
}

// MARK: - UI Setup

extension ProductPageViewController {
    
    func setupNavigationBar() {
        title = productObject?.name
    }
  
    func setupContainerScrollView() {
        containerScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
    }
  
    func setupUI() {
        setAddToCartButtonText()
        setupAddToCartButton(isEnabled: true)
        styleThumbnailImageView()
        styleAddToCartButton()
    }
    
    func setAddToCartButtonText() {
        let addToCartButtonText = NSLocalizedString("Add to Shopping Cart", comment: "Add to Shopping Cart Button label text")
        attributedCartButtonText = addToCartButtonText.toStyleString(with: 16, and: .semibold)
    }
    
    func setupAddToCartButton(isEnabled: Bool) {
        let buttonText = isEnabled ? attributedCartButtonText : NSAttributedString(string: "", attributes: nil)
        addToCartButton.setAttributedTitle(buttonText, for: .normal)
        addToCartButton.isEnabled = isEnabled
    }
    
    func styleThumbnailImageView() {
        productImageView.addBorderStyle(borderWidth: 1, borderColor: .imageBorderGray)
        productImageView.addCornerRadius(5)
        productImageView.addDropShadow(opacity: 0.23, radius: 6, offset: .zero, lightColor: .gray, darkColor: .white)
    }
  
    func styleAddToCartButton() {
        addToCartButton.addCornerRadius(25)
    }
}

// MARK: - Product Information Loading

extension ProductPageViewController {
    
    func loadProductInfo() {
        loadImage()
        setupProductInfoLabels()
    }
    
    func loadImage() {
        guard let product = productObject, let imageURL = ProductInfoHelper.canCreateImageUrl(from: product.imageUrl) else {
            print("ERROR: Product or image URL is nil")
            return
        }
        
        imageLoader?.loadImage(imageURL) { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.productImageView.image = image
                }
            case .failure(let error):
                print("ERROR: Failed to load image - \(error.localizedDescription)")
            }
        }
    }
    
    func setupProductInfoLabels() {
        guard let product = productObject else { return }
        productDescriptionLabel.attributedText = ProductAttributedStringHelper.getAttributedDescription(from: product, withSize: 16)
        productDescriptionLabel.restorationIdentifier = "product_description"
        productPriceLabel.attributedText = ProductAttributedStringHelper.getAttributedPrice(from: product, withSize: 28)
        productPriceLabel.restorationIdentifier = "placholer01"
    }
}

// MARK: - Beyable SDK Integration

extension ProductPageViewController {
    
    func sendProductViewEventToBeyable() {
        guard let product = productObject else { return }
        
        let productBY = BYProductAttributes(
            reference: product.id,
            name: product.name,
            url: product.imageUrl,
            priceBeforeDiscount: product.price.value ?? 0.0,
            sellingPrice: product.price.value ?? 0.0,
            stock: 1,
            thumbnailUrl: "",
            tags: ["type:\(product.type ?? "")", "material:\(product.info?.material ?? "")"]
        )
        
        AppDelegate.instance.beyableClient.sendPageview(
            page: EPageUrlTypeBeyable.PRODUCT,
            currentView: self.view,
            attributes: productBY,
            callback: nil
        )
    }
}
