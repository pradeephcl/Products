//
//  ProductsView.swift
//  MVVMSwiftUIDemo
//
//  Created by Pradeep Kumar on 27/03/24.
//

import SwiftUI

public struct ProductListView<T: ProductManagerDelegate,ProdcutListViewModel>: View {
    @StateObject private var viewModel: DefaultProductListViewModel<T>
    
    public init(userName: String) {
        _viewModel = StateObject(wrappedValue: DefaultProductListViewModel(username: userName))
    }
    public var body: some View {
        ZStack {
            NavigationStack{
                List(self.viewModel.productlist, id: \.self) { data in
                    ProductCellView(name: data?.title ?? "", gener: data?.genre ?? "", price: "\(data?.price ?? "")", imageName: data?.imageUrlSmall ?? "", salesRanking: data?.salseRank ?? "", rating: "\(data?.rating ?? 0)").onTapGesture {
                        viewModel.selectedProduct = data
                        viewModel.shouldNavigate = true
                    }
                }.listStyle(.plain)
                    .refreshable {
                        viewModel.getProductList(true, success: {_ in })
                    }
                    .navigationDestination(isPresented: $viewModel.shouldNavigate) {
                        ProductDetailView(selectedProduct: viewModel.selectedProduct)}
                    .navigationBarTitle(AppConstants.products, displayMode: .inline)
//                    .navigationBarBackButtonHidden(true)
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text(AppConstants.alert),
                      message: Text(viewModel.alertMessage))
            })
            .onAppear() {
                viewModel.getProductList( success: { _ in })
            }
            if viewModel.showLoader {
                ProgressView(AppConstants.loading)
            }
        }
        
    }
}
