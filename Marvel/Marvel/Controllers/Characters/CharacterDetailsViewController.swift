//
//  CharacterDetailsViewController.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/12/20.
//

import UIKit

protocol CharacterDetailsViewPresenting {
    func showLoading()
    func showCharacter(_ character: Character?)
    func showError(_ error: String)
    func hideLoading()
}

class CharacterDetailsViewController: BaseViewController {
    
    private lazy var characterDetailsView = CharacterDetailsView()
    var idCharacter: Int = 0
    var presenter: CharacterDetailsPresenter!
    
    override func loadView() {
        super.loadView()
        view = characterDetailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadCharacter(with: idCharacter)
    }
}

extension CharacterDetailsViewController: CharacterDetailsViewPresenting {

    func showLoading() {
        showLoadingView(with: "Carregando")
    }
    
    func hideLoading() {
        hideLoadingView()
    }
    
    func showCharacter(_ character: Character?) {
        characterDetailsView.setupCharacter(with: character)
    }
    
    func showError(_ error: String) {
        showErrorMessage(error: error)
    }
}
