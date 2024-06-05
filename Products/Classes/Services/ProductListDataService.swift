//
//  ProductAPIClient.swift
//  MVVMSwiftUIDemo
//
//  Created by Pradeep Kumar on 27/03/24.
//

import Foundation
import NetwokingTest

protocol ProductListDataServiceProtocol {
    func getProductListData(success: @escaping ([ProductInfo]) -> Void, failure: @escaping (Error) -> Void)
}

class ProductListDataService: ProductListDataServiceProtocol {
    // Func to get product list data
    func getProductListData(success: @escaping ([ProductInfo]) -> Void, failure: @escaping (Error) -> Void) {

        guard let url = URL(string: AppConstants.productListUrl) else { return }
        NetworkManager.shared.getData(url: url, expecting: [ProductInfo].self) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    success(data)
                }
            case .failure( let error):
                DispatchQueue.main.async {
                    failure(error)
                }
            }
        }
    }
}
