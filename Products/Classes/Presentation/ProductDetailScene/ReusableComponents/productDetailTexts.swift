//
//  productDetailTexts.swift
//  MVVMSwiftUIDemo
//
//  Created by Pradeep Kumar on 28/03/24.
//

import SwiftUI

struct productDetailTexts: View {
    let name: String
    let gener: String
    let price: String
    let salesRanking: String
    let publisher: String
    let rating: String
    let description: String
    var body: some View {
        ScrollView(showsIndicators: false, content: {
            VStack(alignment: .leading, spacing: 11) {
                Text(name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(gener)
                    .foregroundColor(Color(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)))
                    .font(.callout)
                HStack{
                    Text("\(AppConstants.publisher):")
                    Spacer()
                    Text(publisher)
                }
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
                Text(description)
            }
        })
        .padding(20)
    }
}
