//
//  getProductsUseCase.swift
//  LululemonAssessment
//
//  Created by Pradeep Kumar on 10/04/24.
//

import Foundation

protocol GetProductsUseCase {
    func execute(
        requestValue: getProductsUseCaseRequestValue,
        success: @escaping ([ProductInfo]) -> Void,
        failure: @escaping (Error) -> Void
    )
}

final class DefaultgetProductsUseCase: GetProductsUseCase {
    private let productsRepository: ProductsRepository
    
    init( productsRepository: ProductsRepository = DefaultProductRepository()) {
        self.productsRepository = productsRepository
    }
    func execute(requestValue: getProductsUseCaseRequestValue, success: @escaping ([ProductInfo]) -> Void, failure: @escaping (Error) -> Void) {
        productsRepository.fetchProductsList(query: requestValue.username, isPulledToRefresh: requestValue.isPullToRefresh) { result in
            success(result)
        } failure: {_ in 
            
        }
    }
}
struct getProductsUseCaseRequestValue {
    let username: String
    let isPullToRefresh: Bool
}
