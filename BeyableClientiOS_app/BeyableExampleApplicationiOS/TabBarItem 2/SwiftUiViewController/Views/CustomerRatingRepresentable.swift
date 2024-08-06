//
//  CustomerRatingRepresentable.swift
//  BeyableExampleApplicationiOS
//
//  Created by MarKinho on 30/07/2024.
//

import SwiftUI
import SwiftUI

struct CustomerRatingRepresentable: View {
    let ratingType: RatingType
    let rating: Double
    let ratingValue: Int

    enum RatingType {
        case button
        case summary
    }

    var body: some View {
        HStack {
            Text(String(format: "%.1f", rating))
                .font(.headline)
            Text("(\(ratingValue))")
                .font(.subheadline)
        }
    }
}

//#Preview {
//    CustomerRatingRepresentable(ratingType: RatingType.button, rating: 3, ratingValue: 5)
//}
