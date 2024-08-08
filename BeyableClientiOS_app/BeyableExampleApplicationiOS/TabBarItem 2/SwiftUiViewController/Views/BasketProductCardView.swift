import SwiftUI
import BeyableSDK

struct BasketProductCardView: View, OnCtaDelegate {
    

    // MARK: - Dependencies
    struct Dependencies {
        //let quantityController: QuantityPickerViewControllable?
        //let displayMixtureTapController: CheckoutTapWithEanValueControllable?
        //let replaceController: ReplacePickerViewControllable?
    }
  
    // MARK: - Properties
    private let viewModel: Product
    /// ⚠️ Used for analytics. Do not use this index to access an array of any sort ⚠️
    private let index: Int
  
    // MARK: - Life cycle
    init(viewModel: Product, index: Int) {
        self.viewModel = viewModel
        self.index = index
    }
  
    // MARK: - Body
    public var body: some View {
        HStack(alignment: .top, spacing: 10) {
            AsyncImage(url: URL(string: viewModel.imageUrl!)) {
                $0
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
            } placeholder: {
                Image(uiImage: Icon.info.uiImage)
                    .resizable()
                    .foregroundStyle(Color.blue)
                    .padding([.vertical, .horizontal], 10)
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .cornerRadius(4)
            }
            .accessibilityIdentifier(AccessibilityIdentifier.productImage.rawValue)
      
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(verbatim: viewModel.name)
                        .font(.body)
                        .accessibilityIdentifier(AccessibilityIdentifier.nameLabel.rawValue)
                    BYInCollectionPlaceHolder(                        
                        placeHolderId: "cart_product_title",
                        elementId: viewModel.name,
                        delegate: self)
                    Text(verbatim: viewModel.type)
                        .font(.caption)
                        .foregroundStyle(Color.black)
                        .accessibilityIdentifier(AccessibilityIdentifier.brandNameLabel.rawValue)
                    Text(verbatim: viewModel.type)
                        .font(.caption)
                        .foregroundStyle(Color.black)
                        .accessibilityIdentifier(AccessibilityIdentifier.packageLabel.rawValue)
                    Text(verbatim: String(format: "%.2f", viewModel.price.value))
                        .font(.caption)
                        .foregroundStyle(Color.red)
                        .accessibilityIdentifier(AccessibilityIdentifier.pricePerUnit.rawValue)
                    Text(verbatim: viewModel.type)
                        .font(.caption)
                        .foregroundStyle(Color.gray)
                        .accessibilityIdentifier(AccessibilityIdentifier.originLabel.rawValue)
                }
                //if let promoViewModel = viewModel.promoViewModel {
                //  PromoLabelView(viewModel: promoViewModel) {
                //    dependencies.displayMixtureTapController?.didTap(withEan: viewModel.ean, channelType: viewModel.channelType)
                //  }
                //}
            }
            .accessibilityElement(children: .combine)
            .frame(maxWidth: .infinity, alignment: .leading)
      
            VStack(alignment: .trailing, spacing: 10) {
                VStack(alignment: .trailing, spacing: 0) {
                    Text(verbatim: String(format: "%.2f€", viewModel.price.value))
                        .foregroundColor(Color.blue)
                        .fontWeight(Font.Weight.heavy)
                        .accessibilityIdentifier(AccessibilityIdentifier.priceLabel.rawValue)
                }
            }
        }
        .buttonStyle(.plain)
        .padding(10)
    }
    
    
    func onBYClick(cellId: String, value: String) {
        NSLog("Campaing clicked for cell \(cellId) with value \(value)")
    }
    
    
    @ViewBuilder
    private var subPrice: some View {
        let subPriceString: String = "\(viewModel.price)"
        Text(subPriceString)
            .accessibilityIdentifier(AccessibilityIdentifier.subPriceLabel.rawValue)
            .accessibilityLabel(AccessibilityIdentifier.subPriceLabel.rawValue)
              //viewModel.hasPriceBeforePromotions ?
              //  Localization.A11yLabel.priceBeforePromotion.localized(subPriceString).improvedForReadability :
              //  Localization.A11yLabel.savedAmount.localized(subPriceString).improvedForReadability
    }
  
    @ViewBuilder
    private func pickerView() -> some View {
        //switch viewModel.pickerState {
        //case .replace:
        //  ReplacePickerView(isLoading: viewModel.isLoading) {
        //    dependencies.replaceController?.replace(ean: viewModel.ean)
        //  }
      
        //case .cartAdd:
        //  CartAddPickerView(isLoading: viewModel.isLoading) {
        //     dependencies.quantityController?.increment(
        //      quantity: 0,
        //      ean: viewModel.ean,
        //      isSponsored: viewModel.isSponsored,
        //      channelType: viewModel.channelType
        //    )
        //  }

        //case let .quantity(viewModel):
        //  QuantityPickerView(
        //    viewModel: viewModel,
        //    remove: {
        //      dependencies.quantityController?.decrement(
        //        quantity: viewModel.quantity,
        //        ean: viewModel.ean,
        //        isSponsored: viewModel.isSponsored,
        //        channelType: viewModel.channelType
        //      )
        //    },
        //    add: {
        //      dependencies.quantityController?.increment(
        //        quantity: viewModel.quantity,
        //        ean: viewModel.ean,
        //        isSponsored: viewModel.isSponsored,
        //        channelType: viewModel.channelType
        //      )
        //    }
        //  )
          
        //case .none:
        EmptyView()
        //}
    }
}


// MARK: - Accessibility

extension BasketProductCardView {
    private enum AccessibilityIdentifier: String, RawRepresentable {
        case productImage       = "product.image"
        case sponsoredLabel     = "sponsored.label"
        case nameLabel          = "name.label"
        case brandNameLabel     = "brandName.label"
        case packageLabel       = "package.label"
        case pricePerUnit       = "pricePerUnit.label"
        case originLabel        = "origin.label"
        case priceLabel         = "price.label"
        case subPriceLabel      = "subPrice.label"
    }
}
