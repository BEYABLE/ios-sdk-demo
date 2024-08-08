//
//  ProductDetailView.swift
//  BeyableExampleApplicationiOS
//
//  Created by MarKinho on 30/07/2024.
//

import SwiftUI
import BeyableSDK

struct ProductDetailView: View {

    // MARK: - Properties
    var product: Product
    @ObservedObject var imageLoader = ImageLoader()
    
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {                
                VStack(alignment: .leading, spacing: 20) {
                    // Product Image
                    if let uiImage = imageLoader.image {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: ContentMode.fit)
                            .cornerRadius(10)
                            .shadow(radius: 6)
                            .padding(.horizontal)
                            .frame(width: .infinity, height: 250)
                    } else {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .frame(height: 250)
                            .onAppear {
                                if let imageUrl = product.imageUrl {
                                    imageLoader.loadImage(from: imageUrl)
                                }
                            }
                    }
                    
                    // Product Info
                    VStack(alignment: .leading, spacing: 10) {
                        Text(product.type.capitalizingFirstLetter())
                            .font(.body)
                            .foregroundColor(.secondary)
                        Text(product.price.value.formatted(.currency(code: "EUR")))
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                        BYInPagePlaceHolder(placeHolderId: "placholer01")
                        Text(product.description!)
                            .font(.body)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            
            // Add to Cart Button
            Button(action: {
                addToCart()
            }) {
                Text("Add to Shopping Cart")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(25)
                    .padding(.horizontal)
            }
            Spacer()
        }
        .navigationTitle(product.name)
        .onAppear {
            sendProductViewEventToBeyable()
        }
    }
    
    // MARK: - Methods
    func addToCart() {
        // Call delegate or closure to handle adding product to cart
        print("Product added to cart: \(product.name)")
    }
    
    func sendProductViewEventToBeyable() {
        
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
            url: "/product_detail_\(product.id)",
            page: EPageUrlTypeBeyable.PRODUCT,
            currentView: UIApplication.shared.windows.first?.rootViewController?.view ?? UIView(),
            attributes: productBY,
            callback: nil
        )
    }
}

// MARK: - Image Loader

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let uiImage = UIImage(data: data) else {
                print("Failed to load image from URL: \(urlString)")
                return
            }
            
            DispatchQueue.main.async {
                self.image = uiImage
            }
        }.resume()
    }
}

// MARK: - Preview
