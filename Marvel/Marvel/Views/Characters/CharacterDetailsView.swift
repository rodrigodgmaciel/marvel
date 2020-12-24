//
//  CharacterDetailsView.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 23/12/20.
//

import UIKit

class CharacterDetailsView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.sizeToFit()
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .justified
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    
    private lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var heightImageView: CGFloat = 250
    private var heightTitleLabel: CGFloat = 40
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }
}

    //MARK: - setupConstraints
extension CharacterDetailsView {
    
    private func setupConstraints() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: topAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)])
        
        NSLayoutConstraint.activate([contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                                     contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                                     contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)])
        
        NSLayoutConstraint.activate([thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     thumbnailImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     thumbnailImageView.heightAnchor.constraint(equalToConstant: heightImageView)])
        
        NSLayoutConstraint.activate([titleLabel.heightAnchor.constraint(equalToConstant: heightTitleLabel),
                                     titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8),
                                     titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                                     titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)])
        
        NSLayoutConstraint.activate([descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                                     descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                                     descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                                     descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)])
        
        NSLayoutConstraint.activate([contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)])
        
    }
}

    //MARK: - setupCharacter
extension CharacterDetailsView {
    
    func setupCharacter(with character: Character?) {
        
        if let character = character {
            titleLabel.text = character.name
            descriptionLabel.text = character.description
            guard let thumbnail = character.thumbnail else { return }
            let url = "\(thumbnail.path).\(thumbnail.ext)"
            thumbnailImageView.sd_setImage(with: URL(string: url))
        }
    }
}
