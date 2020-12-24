//  AcitivityView.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 22/12/20.
//
import UIKit

class ActivityView: UIView {
    
    lazy var backgroundView: UIView = {
        let v = UIView(frame: .zero)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        v.layer.cornerRadius = 10
        v.layer.masksToBounds = true
        return v
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let i = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        i.color = .white
        i.startAnimating()
        return i
    }()
    
    lazy var textLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 14)
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.textAlignment = .center
        l.textColor = .white
        return l
    }()

    private lazy var stackView: UIStackView = {
        
        let v = UIStackView(arrangedSubviews: [self.activityIndicator, self.textLabel])
        v.distribution = .fill
        v.axis = .vertical
        v.spacing = 5
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupConstraints()
    }
    
    func setupConstraints() {
        
        addSubview(self.backgroundView)
                
        self.backgroundView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.backgroundView.widthAnchor.constraint(equalToConstant: 100).isActive = true
  
        self.backgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.backgroundView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.backgroundView.addSubview(self.stackView)
        
        self.stackView.leadingAnchor.constraint(equalTo: self.backgroundView.leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.backgroundView.trailingAnchor).isActive = true
        self.stackView.centerXAnchor.constraint(equalTo: self.backgroundView.centerXAnchor).isActive = true
        self.stackView.centerYAnchor.constraint(equalTo: self.backgroundView.centerYAnchor).isActive = true
        
    }

}
