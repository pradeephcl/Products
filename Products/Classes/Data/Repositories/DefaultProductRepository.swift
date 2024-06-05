//
//  DefaultProductRepository.swift
//  LululemonAssessment
//
//  Created by Pradeep Kumar on 10/04/24.
//

import Foundation
import NetwokingTest

class DefaultProductRepository: ProductsRepository {
    private let swiftDataStorage: SwiftDataStorage
    private let serverDataStorage: NetworkManager

    init(swiftDataStorage: SwiftDataStorage = SwiftDataStorage.shared, serverDataStorage: NetworkManager = NetworkManager.shared) {
        self.swiftDataStorage = swiftDataStorage
        self.serverDataStorage = serverDataStorage
    }
    func fetchProductsList(query: String, isPulledToRefresh: Bool, success: @escaping ([ProductInfo]) -> Void, failure: @escaping (Error) -> Void) {
        //CASE 1. If user already exist show data for persistance storage
        if !isPulledToRefresh && swiftDataStorage.isRecordExistFor(username: query) {
            success(getProductsFromLocalStorage(userName: query, sortDescriptior: SortDescriptor(\Product.id)))
            return
        }
        // CASE 2. Call API if user logging in first time on device OR User pulled to refresh
        guard let url = URL(string: AppConstants.productListUrl) else { return }
        serverDataStorage.getData(url: url, expecting: [ProductInfo].self) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    if isPulledToRefresh {
                        // CASE 2(a). User pulled to refresh
                        // delete existing products before inserting new
                        self.swiftDataStorage.deleteRecordsFor(username: query)
                        
                    }
                    // CASE 2(b). User logging in first time on device
                    self.saveProductsList(products: data.map({self.convertToProductModel(input: $0, username: query)}))
                    success(self.getProductsFromLocalStorage(userName: query, sortDescriptior: SortDescriptor(\Product.id)))
                }
            case .failure( let error):
                DispatchQueue.main.async {
                    failure(error)
                }
            }
        }
    }
    func saveProductsList(products: [Product]) {
        swiftDataStorage.insertRecords(products: products)
    }
    private func getProductsFromLocalStorage(userName: String, sortDescriptior: SortDescriptor<Product>) -> [ProductInfo] {
        return swiftDataStorage.fetchItems(userName: userName, sortDescriptor: sortDescriptior).map({self.convertToProdcutInfoModel(input: $0)})
    }
    private func convertToProductModel(input: ProductInfo, username: String) -> Product {
        return Product(data: input, username: username)
    }
    private func convertToProdcutInfoModel(input: Product) -> ProductInfo {
        return input.data
    }
}
