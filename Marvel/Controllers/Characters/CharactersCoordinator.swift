//
//  CharactersCoordinator.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/12/20.
//

import UIKit


class CharactersCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, childCoordinator: [Coordinator]? = nil) {
        self.navigationController = navigationController
    }
    
    func start() {
        showCharacters()
    }
}

extension CharactersCoordinator {
    
    func showCharacters() {
        let viewController = CharactersViewController()
        let presenter = CharactersPresenter(service: CharactersService(), view: viewController, delegate: self)
        viewController.presenter = presenter
        navigationController.viewControllers = [viewController]
    }
    
    func showDetailsCharacter(_ idCharacter: Int) {
        let viewController = CharacterDetailsViewController()
        let presenter = CharacterDetailsPresenter(service: CharactersService(), view: viewController)
        viewController.presenter = presenter
        viewController.idCharacter = idCharacter
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension CharactersCoordinator: CharactersPresenterDelegate {
    
    func didSelectedCharacter(_ idCharacter: Int) {
        showDetailsCharacter(idCharacter)
    }
}
