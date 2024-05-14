//
//  productDetailTexts.swift
//  MVVMSwiftUIDemo
//
//  Created by Pradeep Kumar on 28/03/24.
//

import SwiftUI

struct productDetailTexts: View {
    let price: String
    let storageOptions: String
    let colorOptions: String
    let description: String
    var body: some View {
        VStack(alignment: .leading, spacing: 11) {
            Text(price)
            Text(storageOptions)
            Text(colorOptions)
            Text(description)
        }
        .padding(20)
    }
}
