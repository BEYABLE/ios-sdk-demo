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
            // Send page to Beyable
             AppDelegate.instance.beyableClient.sendPageview(
                page: EPageUrlTypeBeyable.CART,
                currentView: self,
                attributes: BYCartAttributes(tags: []),
                cartInfos: BYCartInfos(items: []),
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
