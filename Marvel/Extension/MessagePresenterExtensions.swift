//
//  MessagePresenterExtensions.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 22/12/20.
//

import UIKit

extension MessagePresenter where Self: UIViewController {
    
    func showErrorMessage(error: String?) {
        showMessage(message: error, title: "Atenção")
    }
    
    func showMessage(message: String?, title: String? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
