//
//  ResultModel.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 22/12/20.
//

import Foundation

struct ResultModel<T: Decodable>: Decodable {
    var code: Int?
    var status: String?
    var data: T?
}
