//
//  Thumbnail.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 22/12/20.
//

import Foundation

struct Thumbnail: Codable {

    let path: String
    let ext: String
    
    private enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        path = try values.decodeIfPresent(String.self, forKey: .path).unwrappedValue
        ext = try values.decodeIfPresent(String.self, forKey: .ext).unwrappedValue
    }
}
