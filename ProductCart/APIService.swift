//
//  ProductSelectionView.swift
//  ProductCart
//
//  Created by Andrii on 07.10.2023.
//

import Foundation

class APIService {
    
    static let shared = APIService() // Singleton для доступа к классу

    private let baseURL = "https://api.api-ninjas.com/v1/nutrition" // Базовый URL вашего API
    private let apiKey = "XCwsVHzL8Wl4ijqaM6DWmQ==CFLLYE0YUVgk9UDa" // Ваш API ключ
    
    private init(){}

    func fetchNutritionData(for query: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        if let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: baseURL + "?query=" + encodedQuery) {
            var request = URLRequest(url: url)
            request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Ошибка при выполнении запроса: \(error.localizedDescription)")
                    completion(.failure(error))
                    return
                }

                guard let data = data else {
                    print("Данные отсутствуют")
                    completion(.failure(NSError(domain: "NoData", code: 0, userInfo: nil)))
                    return
                }
                
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("JSON: \n\(jsonString)")
                }

                do {
                                let decoder = JSONDecoder()
                                let products = try decoder.decode([Product].self, from: data)
                                completion(.success(products))
                            } catch {
                                do {
                                    // Попробуйте декодировать как одиночный объект Product
                                    let decoder = JSONDecoder()
                                    let product = try decoder.decode(Product.self, from: data)
                                    completion(.success([product]))
                                } catch {
                                    print("Ошибка при декодировании данных: \(error.localizedDescription)")
                                    completion(.failure(error))
                                }
                            }
            }.resume()
        }
    }

}

