//
//  MarvelService.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/12/20.
//

import Foundation
import UIKit

enum MarvelService {
    
    static let baseUrlString = "https://gateway.marvel.com/"
    static let apiVersion = "v1/"
    static let privateKey = "7eb31cd0c8dbf9e1eaabf85e2fd610909d9bcfa0"
    static let publicKey = "5ec3b77555354c4688df7eb4dd482ee5"
    
    case characters(offset: Int)
    case charactersDetails(id: Int)
    
    private enum HTTPMethod {
        case get
        case post
        case put
        case delete
        
        var value: String {
            switch self {
            case .get: return "GET"
            case .post: return "POST"
            case .put: return "PUT"
            case .delete: return "DELETE"
            }
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .characters: return .get
        case .charactersDetails: return .get
        }
    }

    var path: String {
        switch self {
        case .characters:
            return "public/characters?"
        case .charactersDetails(let id):
            return "public/characters/\(id)?"
        }
    }
    
    var parameters: String {
        
        switch self {
        case .characters(let offset):
            return ["offset": offset].queryString.unwrappedValue
        default:
            return [:].queryString.unwrappedValue
        }
    }
    
    var credentials: String {
        
        let ts = Date().timeIntervalSince1970.description
        let hash = "\(ts)\(MarvelService.privateKey)\(MarvelService.publicKey)".md5
        let authParams = ["ts": ts, "apikey": MarvelService.publicKey, "hash": hash]
        return authParams.queryString.unwrappedValue
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let urlString = "\(MarvelService.baseUrlString)\(MarvelService.apiVersion)\(path)\(credentials)\(parameters)"
        
        guard let url = URL(string: urlString) else { throw ErrorType.parseUrlFail }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        urlRequest.httpMethod = method.value
        
        switch self {
        case .characters:
            return urlRequest
        case .charactersDetails:
            return urlRequest
        }
    }
}
