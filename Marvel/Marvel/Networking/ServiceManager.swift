//
//  ServiceManager.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 21/12/20.
//

import Foundation

class ServiceManager {
    
    private let config: URLSessionConfiguration
    private let session: URLSession
    
    init() {
        config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    func request<T: Decodable>(type: T.Type, router: MarvelService, completion: @escaping NetworkCompletion<T>) {
        do {
            let task = try session.dataTask(with: router.asURLRequest()) { (data, response, error) in
                DispatchQueue.main.async {
                    
                    guard let statusCode: Int = response?.getStatusCode else {
                        return completion(.failure(error: .noConnectivity))
                    }
                    
                    if let error = error {
                        completion(.failure(error: .defaultError(error)))
                    }
                    
                    guard let data = data else {
                        return completion(.failure(error: .unknown))
                    }
                    
                    guard let json = data.convertToJson(type: T.self) else {
                        return completion(.failure(error: .invalidJSON))
                    }
                    
                    switch statusCode {
                    case 200...299:
                        completion(.success(data: json))
                    case 500...599:
                        completion(.failure(error: .serverError))
                    default:
                        completion(.failure(error: .unknown))
                        
                    }
                }
            }
            task.resume()
            
        } catch let error {
            completion(.failure(error: .defaultError(error)))
        }
    }
}
