//
//  ProductListViewModel.swift
//  MVVMSwiftUIDemo
//
//  Created by Pradeep Kumar on 27/03/24.
//

import Foundation

class ProductListViewModel: ObservableObject {
    
    @Published var productlist: [ProductInfo?] = []
    @Published var showLoader: Bool = false
    @Published var selection: Bool = false
    @Published var showAlert: Bool = false
    var alertMessage:String = ""
    var selectedProduct: ProductInfo?
    var dataService: ProductListDataServiceProtocol?
    var username: String = ""
   
    init(dataService: ProductListDataServiceProtocol? = ProductListDataService(), userName: String) {
        self.dataService = dataService
        self.username = userName
    }
    
    // func to get product list data
    func getProductList(_ isPulledToRefresh: Bool = false, success: @escaping (Bool) -> Void){
        //CASE 1. If user already exist show data for persistance storage
//        if !isPulledToRefresh && CoreDataManager.manager.isRecordExistFor(user: self.username) {
//            if let products = CoreDataManager.manager.getproductList(userName: self.username) {
//                self.setProductListData(products: products)
//                success(true)
//            }
//            return
//        }
        // CASE 2. Call API if user logging in first time on device OR User pulled to refresh
        showLoader = true
        dataService?.getProductListData(success: { [weak self] productList in
            if isPulledToRefresh {
                // CASE 2(a). User pulled to refresh
                // delete existing products before inserting new
//                CoreDataManager.manager.BatchDeleteProducts(userName: self?.username ?? "") {
//                    self?.saveProductsToPersistenceStore(records: productList){
//                        success(true)
//                    }
//                }
            } else {
                // CASE 2(b). User logging in first time on device
                self?.setProductListData(products: productList)
//                self?.saveProductsToPersistenceStore(records: productList){
//                    success(true)
//                }
            }
        }, failure: {[weak self] error in
            self?.showLoader = false
            success(false)
            if let customError = error as? CustomError {
                self?.alertMessage = customError.localizedDescription
            } else {
                self?.alertMessage = error.localizedDescription
            }
            self?.showAlert = true
        })
    }
    // func to save products to persistance store
//    private func saveProductsToPersistenceStore(records: [ProductInfo], completionHandler: @escaping () -> Void){
//        CoreDataManager.manager.batchInsertProducts(records: records, forUser: self.username) { [weak self] in
//            if let products = CoreDataManager.manager.getproductList(userName: self?.username ?? "") {
//                self?.setProductListData(products: products)
//                completionHandler()
//            }
//        }
//    }
    
    // func to set product list data
    private func setProductListData(products: [ProductInfo?]){
        self.productlist = products.sorted{$0?.id ?? 0 < $1?.id ?? 0}
        DispatchQueue.main.async {
            self.showLoader = false
        }
    }
    
}
