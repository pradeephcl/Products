//
//  AppConstants.swift
//  MVVMSwiftUIDemo
//
//  Created by Pradeep Kumar on 28/03/24.
//

import Foundation

class AppConstants {
    // Product List constants
    static let products = "Products"
    static let loading = "Loading..."
    static let salesRanking = "Sales Ranking"
    static let rating = "Rating"
    
    // Product Detail constants
    static let publisher = "Publisher"
    static let price = "Price"
    static let description = "Description"
    
    // image assets
    static let questionmark = "questionmark"
    
    // common constants
    static let alert = "Alert"
    static let ok = "OK"
    static let dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    //API URLS
    static var productListUrl = "https://www.jsonkeeper.com/b/E7L4"
}

enum AlertType {
    case withAction
    case noAction
}

enum CustomError: Error {
    case invalidUrl
    case fileNotFound
    case dataInitialisation(error: Error)
    case decoding(error: Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidUrl:
          return NSLocalizedString("Invalid URL", comment: "My error")
        default:
          return NSLocalizedString("Unknown Error", comment: "My error")
        }
      }
}
