//
//  DictionaryExtension.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 21/12/20.
//

import Foundation


extension Dictionary {
    
    var queryString: String? {
        return self.reduce("") { "\($0!)\($1.0)=\($1.1)&" }
    }
}
