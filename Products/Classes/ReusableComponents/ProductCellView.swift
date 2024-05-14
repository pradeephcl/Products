//
//  ProductCellView.swift
//  MVVMSwiftUIDemo
//
//  Created by Pradeep Kumar on 27/03/24.
//

import SwiftUI

public struct ProductCellView: View {
    let name: String
    let price: String
    let Description: String
    let imageName: String
    public var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("\(AppConstants.productName): \(name)")
                Text("\(AppConstants.price): \(AppConstants.currency)\(price) ")
                Text("\(AppConstants.description): \(Description)")
            }
            Spacer()
        }
    }
}
