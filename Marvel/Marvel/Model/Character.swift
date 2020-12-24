//
//  Character.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 22/12/20.
//

import Foundation


struct Character: Codable {
    
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail?
 
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id).unwrappedValue
        name = try values.decodeIfPresent(String.self, forKey: .name).unwrappedValue
        description = try values.decodeIfPresent(String.self, forKey: .description).unwrappedValue
        thumbnail = try values.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
    }
}
