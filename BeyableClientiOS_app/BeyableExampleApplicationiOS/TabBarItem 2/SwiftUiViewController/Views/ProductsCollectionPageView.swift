//
//  PageView.swift
//  BeyableExampleApplicationiOS
//
//  Created by MarKinho on 30/07/2024.
//

import SwiftUI
import BeyableSDK

struct ProductsCollectionPageView: View, OnSendPageView {
    
    let products: [Product]
    @State private var count = 0
        
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(products.enumerated()), id: \.element.id) { index, product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        BasketProductCardView(viewModel: product, index: index)
                    }
                }
            }
            .navigationTitle("SwiftUI Collection")
        }
        .onAppear() {
            var category = BYCategoryAttributes(
                CategoryId: "", 
                CategoryName: "all",
                tags: ["Number_Product:\(products.count)"])
            category.contextData = [
                "magasin": "Carrefour Market",
                "magasin_size": "1234"
            ]
            // Send page to Beyable
             AppDelegate.instance.beyableClient.sendPageview(
                url: "/products_collection_swiftui",
                page: EPageUrlTypeBeyable.CATEGORY,
                currentView: self,
                attributes: category,
                callback: self)
        }
    }
    
    func onBYSuccess() {
        NSLog("Cart page BY loaded")
        // Reload
        count += 1
    }
    
    func onBYError() {
        
    }
    
}

//#Preview {
//    //PageView()
//}
