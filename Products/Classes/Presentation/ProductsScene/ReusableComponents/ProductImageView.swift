//
//  ProductImageView.swift
//  MVVMSwiftUIDemo
//
//  Created by Pradeep Kumar on 28/03/24.
//

import SwiftUI
//import SDWebImageSwiftUI

struct productImageView: View {
    let imageName: String
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        AsyncImage(url: URL(string: imageName)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let returnedImage):
                returnedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
                    .cornerRadius(5)
            case .failure:
                Image(systemName: "questionmark")
                    .font(.headline)
            default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }
    }
}
