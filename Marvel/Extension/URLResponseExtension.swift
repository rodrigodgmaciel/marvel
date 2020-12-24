//
//  URLResponseExtension.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 22/12/20.
//

import Foundation

extension URLResponse {
    
    var getStatusCode: Int? {
        guard let httpResponse = self as? HTTPURLResponse else { return nil }
        return httpResponse.statusCode
    }
}
