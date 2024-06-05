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
                productImageView(imageName: selectedProduct?.imageUrlLarge ?? "", width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                productDetailTexts(name: selectedProduct?.title ?? "", gener: selectedProduct?.genre ?? "", price: selectedProduct?.price ?? "", salesRanking: selectedProduct?.salseRank ?? "", publisher: selectedProduct?.publisher ?? "", rating: "\(selectedProduct?.rating ?? 0)", description: "\(AppConstants.description): \(selectedProduct?.productDescription ?? "")")
                Spacer()
            }
            .navigationBarTitle(selectedProduct?.title ?? "", displayMode: .inline)
        }
    }
}

