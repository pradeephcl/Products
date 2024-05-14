//
//  NetworkManager.swift
//  MVVMSwiftUIDemo
//
//  Created by Pradeep Kumar on 31/03/24.
//

import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    
    private init(){}
    // func to handle get request
    func getData<T: Codable>(url: URL?,
                             expecting: T.Type,
                             completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            return completion(.failure(CustomError.invalidUrl))
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error  in
            guard let data = data, !data.isEmpty else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(CustomError.invalidUrl))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
