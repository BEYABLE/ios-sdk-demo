//
//  ProductCartCell.swift
//  BeyableExampleApplicationiOS
//
//  Created by MarKinho on 09/08/2024.
//

import Foundation
import UIKit

public final class ProductCartCell: UIStackView {
    
  private enum Localization: String {
    static var bundle: Bundle { return Bundle.main }
    static var tableName: String? { return "ProductCardContent" }
    case accessibilityOriginLabel = "accessibility.origin.label"
    case accessibilityDeliveryModesLabel = "accessibility.deliveryModes.label"
  }
  
  private enum AccessibilityIdentifier: String {
    case highlightLabel = "highlight.Label"
    case brandNameLabel = "brandName.Label"
    case titleLabel = "title.Label"
    case packageLabel = "package.Label"
    case packagePriceLabel = "packagePrice.Label"
    case originLabel = "origin.Label"
    case promoLabel = "promo.Label"
    case deliveryModesLabel = "deliveryModes.Label"
  }
  
  private enum AvailabilityState {
    case available
    case unavailable
  }
  
  public var isAvailable: Bool = true {
    didSet {
      availabilityState = isAvailable ? .available : .unavailable
    }
  }
  
  private var availabilityState: AvailabilityState = .available {
    didSet {
      applyCurrentStyle()
    }
  }
  
  // MARK: - Views

  private lazy var highlightTag: UILabel = {
    let tag = UILabel()
    tag.translatesAutoresizingMaskIntoConstraints = false
    tag.accessibilityIdentifier = AccessibilityIdentifier.highlightLabel.rawValue
    tag.accessibilityTraits = .staticText
    return tag
  }()

  private lazy var brandNameLabel: UILabel = {
    let label = UILabel()
    //label.ds.maxLines = .fixed(1)
    //label.ds.typography = .body(.m, weight: .regular)
    //label.ds.color = .grey10
    label.translatesAutoresizingMaskIntoConstraints = false
    label.accessibilityIdentifier = AccessibilityIdentifier.brandNameLabel.rawValue
    label.accessibilityTraits = .staticText
    return label
  }()

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    //label.ds.maxLines = .fixed(2)
    //label.ds.typography = .title(.xs, weight: .medium)
    //label.ds.color = .grey5
    label.translatesAutoresizingMaskIntoConstraints = false
    label.accessibilityIdentifier = AccessibilityIdentifier.titleLabel.rawValue
    label.accessibilityTraits = .staticText
    return label
  }()
  
  private let customerRating: UILabel = {
    let customerRating = UILabel()
    
    return customerRating
  }()

  private lazy var packageLabel: UILabel = {
    let label = UILabel()
    //label.ds.maxLines = .fixed(1)
    //label.ds.typography = .body(.m, weight: .regular)
    //label.ds.color = .grey10
    label.translatesAutoresizingMaskIntoConstraints = false
    label.accessibilityIdentifier = AccessibilityIdentifier.packageLabel.rawValue
    label.accessibilityTraits = .staticText
    return label
  }()

  private lazy var packagePriceLabel: UILabel = {
    let label = UILabel()
    //label.ds.maxLines = .fixed(1)
    //label.ds.typography = .body(.m, weight: .regular)
    //label.ds.color = .grey10
    label.accessibilityIdentifier = AccessibilityIdentifier.packagePriceLabel.rawValue
    label.accessibilityTraits = .staticText
    return label
  }()

  private lazy var originLabel: UILabel = {
    let label = UILabel()
    //label.ds.maxLines = .fixed(1)
    //label.ds.typography = .body(.m, weight: .regular)
    //label.ds.color = .grey10
    label.accessibilityIdentifier = AccessibilityIdentifier.originLabel.rawValue
    label.accessibilityTraits = .staticText
    return label
  }()

    private lazy var descriptionStack: UIStackView = {
        let vstack = UIStackView()
        vstack.axis = .vertical
        vstack.addArrangedSubview(packageLabel)
        vstack.addArrangedSubview(packagePriceLabel)
        vstack.addArrangedSubview(originLabel)
      
        return vstack
    }()

  private lazy var vView: UILabel = {
    let view = UILabel()
    view.isHidden = true
    view.accessibilityTraits = .staticText
    view.accessibilityIdentifier = AccessibilityIdentifier.promoLabel.rawValue
    return view
  }()

  private lazy var priceView = UILabel()

  private let facilityServicesStack: UIStackView = {
      let stack = UIStackView()//.spacing(Spacing.xs.rawValue)
      stack.axis = .horizontal
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.accessibilityTraits = .staticText
      stack.accessibilityIdentifier = AccessibilityIdentifier.deliveryModesLabel.rawValue
      return stack
  }()
    
  // MARK: - Init

  public init() {
      super.init(frame: .zero)
      translatesAutoresizingMaskIntoConstraints = false
      isAccessibilityElement = true
      
      self.addArrangedSubview(highlightTag)
      self.addArrangedSubview(brandNameLabel)
      self.addArrangedSubview(titleLabel)
      self.addArrangedSubview(customerRating)
      self.addArrangedSubview(descriptionStack)
      self.addArrangedSubview(priceView)
      self.addArrangedSubview(facilityServicesStack)
  }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    

  // MARK: - Setup

  public func setup(highlightValue: String?) {
    if let highlightValue, !highlightValue.isEmpty {
      highlightTag.text = highlightValue
      highlightTag.isHidden = false
    } else {
      highlightTag.text = ""
      highlightTag.isHidden = true
    }
  }

  public func setupBrandName(brandName: String?) {
    brandNameLabel.isHidden = brandName == nil || brandName?.isEmpty == true
    brandNameLabel.text = brandName
  }

  public func setupTitleLabel(titleValue: String) {
    titleLabel.text = titleValue
  }
  
  public func setupCustomReview(rating: Double, ratingValue: Int) {
    customerRating.isHidden = false
    customerRating.text = "\(rating) - \(ratingValue)"
  }

  public func setupPackage(package: String?) {
    packageLabel.isHidden = package == nil || package?.isEmpty == true
    packageLabel.text = package
  }

  public func setupPackagePrice(packagePrice: String?) {
    packagePriceLabel.isHidden = packagePrice == nil || packagePrice?.isEmpty == true
    packagePriceLabel.text = packagePrice
  }

  public func setupOrigin(origin: String?) {
    guard let origin, !origin.isEmpty else {
      originLabel.isHidden = true
      originLabel.text = nil
      originLabel.accessibilityLabel = nil
      return
    }

    originLabel.isHidden = false
    originLabel.text = origin
    //originLabel.accessibilityLabel = Localization.accessibilityOriginLabel.localized(origin)
  }


  public func hideDiscount() {
    //offerDiscountTitleView.isHidden = true
  }
  
  public func hideCustomerRating() {
    customerRating.isHidden = true
  }

  public func setupPriceView(priceValue: Double) {
      priceView.text = "\(priceValue)"
  }
  
  public func setup(deliveryModes: [String]) {
    facilityServicesStack.subviews.forEach { $0.removeFromSuperview() }
    if deliveryModes.isEmpty {
      facilityServicesStack.isHidden = true
      facilityServicesStack.accessibilityLabel = nil
    } else {
      facilityServicesStack.isHidden = false
    
      
     // facilityServicesStack.accessibilityLabel = Localization.accessibilityDeliveryModesLabel.localized(deliveryModes.joined(separator: ", "))
    }
  }

  public func showPrice() {
    priceView.isHidden = false
    packagePriceLabel.isHidden = false
  }

  public func hidePrice() {
    priceView.isHidden = true
    packagePriceLabel.isHidden = true
  }

  private func applyCurrentStyle() {
    //priceView.isAvailable = isAvailable
    //offerDiscountTitleView.isAvailable = isAvailable
    //titleLabel.ds.color = isAvailable ? .grey5 : .grey20
  }

  public func getAccessibilityLabel() -> String? {
    return [
      highlightTag.accessibilityLabel,
      brandNameLabel.accessibilityLabel,
      titleLabel.accessibilityLabel,
      packageLabel.accessibilityLabel,
      packagePriceLabel.accessibilityLabel,
      originLabel.accessibilityLabel,
      priceView.accessibilityLabel,
      facilityServicesStack.accessibilityLabel,
    ].compactMap { $0 }
      .filter { !$0.isEmpty }
      .joined(separator: ", ")
  }
}
