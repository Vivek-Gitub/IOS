//
//  UserData.swift
//  APi prcatice
//
//  Created by Vivek Patel on 26/04/23.
//

import Foundation

struct Welcome: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}

