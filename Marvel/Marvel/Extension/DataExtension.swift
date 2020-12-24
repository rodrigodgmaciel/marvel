//
//  DataExtension.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 22/12/20.
//

import Foundation

extension Data {
    
    func convertToJson<T: Decodable>(type: T.Type) -> T? {
        let result = try? JSONDecoder().decode(ResultModel<T>.self, from: self)
        return result?.data
    }
}
