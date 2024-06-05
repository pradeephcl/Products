//
//  Item.swift
//  LululemonAssessment
//
//  Created by Pradeep Kumar on 09/04/24.
//

import Foundation
import SwiftData

@Model
final class Product {
    var id: Int
    var data: ProductInfo
    var username: String
    init(data: ProductInfo, username: String) {
        self.data = data
        self.id = data.id ?? 0
        self.username = username
    }
}

