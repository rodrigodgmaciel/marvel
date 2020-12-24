//
//  ViewExtension.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/12/20.
//

import UIKit

extension UIView {
    
    func stretch(view: UIView, top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: topAnchor, constant: top),
                                     view.leftAnchor.constraint(equalTo: leftAnchor, constant: left),
                                     view.rightAnchor.constraint(equalTo: rightAnchor, constant: right),
                                     view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottom)])
    }
}
