//
//  CharactersViewController.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/12/20.
//

import UIKit

protocol CharactersViewPresenting {
    
    func showLoading()
    func showListCharacters(_ characters: [Character])
    func showError(_ error: String)
    func hideLoading()
}

class CharactersViewController: BaseViewController {
    
    private lazy var charactersView = CharactersView()
    var presenter: CharactersPresenter!
    
    override func loadView() {
        super.loadView()
        charactersView.delegate = self
        view = charactersView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Personagens"
        presenter.loadCharacters()
    }
}

extension CharactersViewController: CharactersViewPresenting {

    func showLoading() {
        showLoadingView(with: "Carregando")
    }
    
    func hideLoading() {
        hideLoadingView()
    }
    
    func showListCharacters(_ characters: [Character]) {
        charactersView.items += characters
    }
    
    func showError(_ error: String) {
        showErrorMessage(error: error)
    }
}

extension CharactersViewController: CharactersViewDelegate {
    
    func loadMore() {
        presenter.loadMore()
    }
    
    func reloadListCharacters() {
        presenter.loadCharacters(true)
    }
    
    func didSelectCharacter(_ idCharacter: Int) {
        presenter.didSelectCharacter(idCharacter)
    }
}
