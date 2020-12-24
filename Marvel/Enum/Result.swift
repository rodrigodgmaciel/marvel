//
//  Result.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 22/12/20.
//


import Foundation

typealias NetworkCompletion<T: Decodable> = (_ result: Result<T>)-> Void

enum Result<T> {
    case success(data: T)
    case failure(error: ErrorType)
}
