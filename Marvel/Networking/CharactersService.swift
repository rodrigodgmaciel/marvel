//
//  CharactersService.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 22/12/20.
//

import Foundation


class CharactersService: ServiceManager {
    
    func loadCharacters(offset: Int, completion: @escaping (_ success: Page<Character>?, _ error: Error?) -> ()) {
        
        self.request(type: Page<Character>.self, router: .characters(offset: offset)) { result in
            
            switch result {
            case .success(let response):
                completion(response, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func loadCharacter(with id: Int, completion: @escaping (_ success: Character?, _ error: Error?) -> ()) {
        
        self.request(type: Page<Character>.self, router: .charactersDetails(id: id)) { result in
            switch result {
            case .success(let response):
                completion(response.results?.first, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
