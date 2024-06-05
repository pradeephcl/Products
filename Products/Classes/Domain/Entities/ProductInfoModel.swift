//
//  ProductInfoModel.swift
//  MVVMSwiftUIDemo
//
//  Created by Pradeep Kumar on 27/03/24.
//

import Foundation

struct ProductInfo: Codable, Identifiable, Hashable {
    let id: Int?
    let title: String?
    let genre: String?
    let price: String?
    let salseRank: String?
    let rating: Double?
    let imageUrlSmall: String?
    let imageUrlLarge: String?
    let publisher: String?
    let productDescription: String?
}
