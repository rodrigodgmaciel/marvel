//
//  LoadingViewExtensions.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 23/12/20.
//

import UIKit

extension LoadingView where Self: UIViewController {
    private var tag: Int {
        return 684
    }
    
    func hideLoadingView() {
        self.view.viewWithTag(self.tag)?.removeFromSuperview()
    }
    
    func showLoadingView(with text: String? = nil) {
        let loadingView = ActivityView()
        loadingView.tag = tag
        loadingView.textLabel.text = text
        view.addSubview(loadingView)
        view.stretch(view: loadingView)
    }
        
    func indicatorView() -> UIActivityIndicatorView {
        let indicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        indicatorView.center = CGPoint(x: view.center.x, y: view.center.y)
        indicatorView.startAnimating()
        return indicatorView
    }
}

