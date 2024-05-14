//
//  ProductsView.swift
//  MVVMSwiftUIDemo
//
//  Created by Pradeep Kumar on 27/03/24.
//

import SwiftUI

public struct ProductListView: View {
    @StateObject var viewModel: ProductListViewModel
    
    public init(userName: String) {
        _viewModel = StateObject(wrappedValue: ProductListViewModel(userName: userName))
    }
    
    public var body: some View {
        ZStack {
            NavigationStack{
                List(self.viewModel.productlist, id: \.self) { data in
                    ProductCellView(name: data?.name ?? "", price: "\(data?.basePrice ?? 0)",
                                    Description: data?.description ?? "",
                                    imageName: data?.thumbnailImage ?? "").onTapGesture {
                        viewModel.selectedProduct = data
                        viewModel.selection = true
                    }
                }.listStyle(.plain)
                    .refreshable {
                        viewModel.getProductList(true, success: {_ in })
                    }
                    .navigationDestination(isPresented: $viewModel.selection) {
                        ProductDetailView(selectedProduct: viewModel.selectedProduct)}
                    .navigationBarTitle(AppConstants.products, displayMode: .inline)
                    .navigationBarBackButtonHidden(true)
            }
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
