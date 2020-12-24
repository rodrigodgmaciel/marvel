//
//  Appereance.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 23/12/20.
//

import UIKit

struct Appereance {

    static func setup() {
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().backgroundColor = .red
        UINavigationBar.appearance().barTintColor = .red
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 15, weight: .bold)]
    }
}
