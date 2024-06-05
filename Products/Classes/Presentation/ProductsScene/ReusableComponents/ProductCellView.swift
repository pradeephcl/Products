//
//  ProductCellView.swift
//  MVVMSwiftUIDemo
//
//  Created by Pradeep Kumar on 27/03/24.
//

import SwiftUI

public struct ProductCellView: View {
    let name: String
    let gener: String
    let price: String
    let imageName: String
    let salesRanking: String
    let rating: String
    public var body: some View {
        HStack(alignment: .top) {
            productImageView(imageName: imageName, width: 100, height: 150)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(gener)
                    .foregroundColor(Color(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)))
                    .font(.callout)
                
                HStack{
                    Text("\(AppConstants.price):")
                    Spacer()
                    Text(price)
                    }
                HStack{
                    Text("\(AppConstants.salesRanking):")
                    Spacer()
                    Text(salesRanking)
                    }
                HStack{
                    Text("\(AppConstants.rating):")
                    Spacer()
                    Text(rating)
                    }
            }
            Spacer()
        }
    }
}
