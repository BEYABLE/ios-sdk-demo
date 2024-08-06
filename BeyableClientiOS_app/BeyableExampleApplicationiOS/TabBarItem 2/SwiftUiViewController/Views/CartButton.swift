//
//  CartButton.swift
//  BeyableExampleApplicationiOS
//
//  Created by MarKinho on 30/07/2024.
//

import SwiftUI

struct CartButton: View {
    @Binding var isLoading: Bool
    let price: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                if isLoading {
                    ProgressView()
                } else {
                    Text(price)
                        .font(.headline)
                    Image(systemName: "cart.fill")
                }
            }
            .frame(maxWidth: .infinity, minHeight: 44)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

//#Preview {
//    CartButton(isLoading: false, price: 34, action: ())
//}
