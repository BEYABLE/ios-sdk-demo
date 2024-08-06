//
//  ProductModels.swift
//
//
//  Created by Brahim Ouamassi
//

// MARK: - Product Array

struct ProductInformation: Codable {
    let products: [Product]
}

// MARK: - Product Object

struct Product: Codable {
    let id: String
    let name: String
    let description: String?
    let price: Price
    let info: Info?
    let type: String
    let imageUrl: String?
    let isFavorite: Bool
    let rating: Double
    let availability: String
    let userReviews: [UserReview]?
}

// MARK: - Product's Price

struct Price: Codable {
    let value: Double
    let currency: String
}

// MARK: - Product's Info

struct Info: Codable {
    let material: String?
    let numberOfSeats: Int?
    let color: String?
    let dimensions: String?
    let weight: String?
    let bulbType: String?
}

// MARK: - User Review

struct UserReview: Codable {
    let username: String
    let comment: String
    let rating: Int
}

// MARK: - Product Collection

struct ProductCollection {
    let type: String
    let products: [Product]
}
