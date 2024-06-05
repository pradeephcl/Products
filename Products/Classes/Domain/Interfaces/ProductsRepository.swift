//
//  ProductsRepository.swift
//  DemoLogin
//
//  Created by Pradeep Kumar on 23/05/24.
//

import Foundation

protocol ProductsRepository {
    func fetchProductsList(
        query: String,
        isPulledToRefresh: Bool,
        success: @escaping ([ProductInfo]) -> Void,
        failure: @escaping (Error) -> Void
    )
    func saveProductsList(
        products: [Product]
    )
}
