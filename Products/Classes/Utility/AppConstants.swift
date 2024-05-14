//
//  AppConstants.swift
//  MVVMSwiftUIDemo
//
//  Created by Pradeep Kumar on 28/03/24.
//

import Foundation

class AppConstants {
    // Login View constants
    static let email = "Email"
    static let password = "Password"
    static let login = "Login"
    static let loginHeader = "Enter your email address and password"
    static let emptyEmail = "Email address can't be empty"
    static let invalidEmail = "Please enter valid email address"
    static let emptyPassword = "Password can't be empty"
    static let invalidPassword = "Password must be minmum 6 character long"
    static let incorrectEmailPassword = "Incorrect email or password"
    static let userNotExist = "User doesn't exist, do you want to register and proceed"
    
    // Product List constants
    static let products = "Products"
    static let loading = "Loading..."
    static let productName = "Product Name"
    
    // Product Detail constants
    static let price = "Price"
    static let currency = "$"
    static let description = "Description"
    static let storageOptions = "Storage Options"
    static let colorOptions = "Color Options"
    
    // image assets
    static let placeHolder = "placeHolderLarge"
    static let questionmark = "questionmark"
    
    // common constants
    static let alert = "Alert"
    static let ok = "OK"
    static let dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    //API URLS
    static var productListUrl = "https://dummyapi.online/api/products"
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
