//
//  ProductInfoModel.swift
//  MVVMSwiftUIDemo
//
//  Created by Pradeep Kumar on 27/03/24.
//

import Foundation

struct ProductInfo: Codable, Identifiable, Hashable {
    let id: Int?
    let name: String?
    let basePrice: Int?
    let thumbnailImage: String?
    let description: String?
    let storageOptions: [String]?
    let colorOptions: [String]?

}

//extension ProductInfo {
//    var boxed: ProductInfoConfigurationBox {
//      return ProductInfoConfigurationBox(self)
//  }
//}
