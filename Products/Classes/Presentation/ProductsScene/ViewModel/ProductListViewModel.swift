

import Foundation
protocol ProductListViewModelInput: ObservableObject {
    func getProductList(_ isPulledToRefresh: Bool, success: @escaping (Bool) -> Void)
    func moveToProductDetail()
}
protocol ProductListViewModelOutput: ObservableObject {
    var productlist: [ProductInfo?] { get }
    var selectedProduct: ProductInfo? { get set }
    var shouldNavigate: Bool { get set }
    
}
typealias ProdcutListViewModel = ProductListViewModelInput & ProductListViewModelOutput

class DefaultProductListViewModel<productManager: ProductManagerDelegate>: ProdcutListViewModel {
    @Published var productlist: [ProductInfo?] = []
    @Published var showLoader: Bool = false
    @Published var shouldNavigate: Bool = false
    @Published var showAlert: Bool = false
    var alertMessage:String = ""
    var selectedProduct: ProductInfo?
    var dataService: ProductListDataServiceProtocol?
    var username: String = ""
    private let getProductsUseCase: GetProductsUseCase

    init(getproductUseCase: GetProductsUseCase = DefaultgetProductsUseCase(), username: String) {
        self.getProductsUseCase = getproductUseCase
        self.username = username
    }
    
    // func to get product list data
    func getProductList(_ isPulledToRefresh: Bool = false, success: @escaping (Bool) -> Void){
        showLoader = true
        getProductsUseCase.execute(requestValue: CreateRequest(isPullToRefresh: isPulledToRefresh)) {[weak self] products in
            self?.productlist = products
            DispatchQueue.main.async {
                self?.showLoader = false
            }
        } failure: {[weak self] error in
            self?.showLoader = false
            success(false)
            if let customError = error as? CustomError {
                self?.alertMessage = customError.localizedDescription
            } else {
                self?.alertMessage = error.localizedDescription
            }
            self?.showAlert = true
        }
    }
    func moveToProductDetail() {
        shouldNavigate = true
    }
}
extension DefaultProductListViewModel {
    // func to createRequest to fetch products
    private func CreateRequest(isPullToRefresh: Bool) -> getProductsUseCaseRequestValue{
        getProductsUseCaseRequestValue(username: self.username, isPullToRefresh: isPullToRefresh)
    }
    // func to convert ProductInfo Model to Product Model
    private func convertToProductModel(input: ProductInfo) -> Product {
        return Product(data: input, username: username)
    }
    // func to convert Product Model to ProductInfoModel Model
    private func convertToProductinfoModel(input: Product) -> ProductInfo {
        return input.data
    }
}
