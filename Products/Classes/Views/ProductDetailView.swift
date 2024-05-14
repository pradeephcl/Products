//
//  ProductDetailView.swift
//  MVVMSwiftUIDemo
//
//  Created by Pradeep Kumar on 27/03/24.
//

import SwiftUI

struct ProductDetailView: View {
    let selectedProduct: ProductInfo?
    
    var body: some View {
        NavigationStack() {
            VStack() {
                productImageView(imageName: selectedProduct?.thumbnailImage ?? "", width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/2)
                productDetailTexts(price: "\(AppConstants.price): \(AppConstants.currency)\(selectedProduct?.basePrice ?? 0)",
                                   storageOptions: "\(AppConstants.storageOptions): \(selectedProduct?.storageOptions?.joined(separator: ",") ?? "")",
                                   colorOptions: "\(AppConstants.colorOptions): \(selectedProduct?.colorOptions?.joined(separator: ",") ?? "")",
                                   description: "\(AppConstants.description): \(selectedProduct?.description ?? "")")
                Spacer()
            }
            .navigationBarTitle(selectedProduct?.name ?? "", displayMode: .inline)
        }
    }
}

