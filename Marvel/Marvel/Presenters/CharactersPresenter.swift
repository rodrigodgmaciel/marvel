//
//  CharactersPresenter.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/12/20.
//

import Foundation

protocol CharactersPresenterDelegate: AnyObject {
    func didSelectedCharacter(_ idCharacter: Int)
}

class CharactersPresenter {
    
    private let view: CharactersViewPresenting
    private let service: CharactersService
    private weak var delegate: CharactersPresenterDelegate?
    private var characters: [Character] = []
    private var totalItems: Int = 0
    private var isFetchingItems: Bool = false
    
    init(service: CharactersService, view: CharactersViewPresenting, delegate: CharactersPresenterDelegate?) {
        self.view = view
        self.service = service
        self.delegate = delegate
    }
    
    func loadCharacters(_ reload: Bool = false) {
        if !reload { view.showLoading() }
        
        service.loadCharacters(offset: 0) { [weak self] (page, error) in
            guard let self = self else { return }
            
            self.view.hideLoading()
            if let error = error {
                self.view.showError(error.localizedDescription)
            } else {
                guard let page = page else { return }
                self.totalItems = page.total.unwrappedValue
                self.characters = page.results.unwrappedValue
                self.view.showListCharacters(page.results.unwrappedValue)
            }
        }
    }
    
    func loadMore() {
        
        guard totalItems > self.characters.count else { return }
        
        service.loadCharacters(offset: characters.count) { [weak self] (page, error) in
            guard let self = self else { return }
            if let error = error {
                self.view.showError(error.localizedDescription)
            } else {
                guard let page = page else { return }
                self.totalItems = page.total.unwrappedValue
                self.characters += page.results.unwrappedValue
                self.view.showListCharacters(page.results.unwrappedValue)
            }
        }
    }
    
    func didSelectCharacter(_ idCharacter: Int) {
        delegate?.didSelectedCharacter(idCharacter)
    }
}
