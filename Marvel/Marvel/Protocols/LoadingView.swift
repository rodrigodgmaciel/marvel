//  LoadingView.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 23/12/20.
//
import Foundation


protocol LoadingView {
    func showLoadingView(with text: String?)
    func hideLoadingView()
}
