//
//  AppCoordinator.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/12/20.
//

import UIKit


class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private var window: UIWindow
    
    init(window: UIWindow) {
        
        self.window = window
        self.navigationController = UINavigationController()
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
        
    }
      
    func start() {
        self.showCharactersCoordinator()
    }
}

extension AppCoordinator {
    
    func showCharactersCoordinator() {
        
        let charactersCoordinator = CharactersCoordinator(navigationController: navigationController)
        addChildCoordinator(charactersCoordinator)
        charactersCoordinator.start()
    }
}
