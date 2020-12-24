//
//  MessagePresenter.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 22/12/20.
//

import Foundation

protocol MessagePresenter {
    func showErrorMessage(error: String?)
    func showMessage(message: String?, title: String?)
}
