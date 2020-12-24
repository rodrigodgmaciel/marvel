//
//  Page.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 22/12/20.
//

import Foundation


struct Page<T: Decodable>: Decodable {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var results: [T]?
}
