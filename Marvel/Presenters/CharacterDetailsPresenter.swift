//
//  CharacterDetailsPresenter.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 23/12/20.
//

import Foundation

class CharacterDetailsPresenter {
    
    private let view: CharacterDetailsViewPresenting
    private let service: CharactersService

    init(service: CharactersService, view: CharacterDetailsViewPresenting) {
        self.view = view
        self.service = service
    }
    
    func loadCharacter(with id: Int) {
        view.showLoading()
        service.loadCharacter(with: id) { [weak self] (character, error) in
            
            guard let self = self else { return }
            self.view.hideLoading()
            if let error = error {
                self.view.showError(error.localizedDescription)
            } else {
                self.view.showCharacter(character)
            }
        }
    }
}
