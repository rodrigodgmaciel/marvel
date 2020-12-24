//
//  CharacterTableViewCell.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/12/20.
//

import UIKit
import SDWebImage

class CharacterTableViewCell: UITableViewCell {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var nameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    
    private lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }
    
    func setupConstraints() {
        
        addSubview(thumbnailImageView)
        addSubview(nameView)
        addSubview(nameLabel)
        NSLayoutConstraint.activate([thumbnailImageView.topAnchor.constraint(equalTo: topAnchor),
                                     thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor)])
        
        NSLayoutConstraint.activate([nameView.heightAnchor.constraint(equalToConstant: 40),
                                     nameView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     nameView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     nameView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
        NSLayoutConstraint.activate([nameLabel.heightAnchor.constraint(equalToConstant: 24),
                                     nameLabel.leadingAnchor.constraint(equalTo: nameView.leadingAnchor),
                                     nameLabel.trailingAnchor.constraint(equalTo: nameView.trailingAnchor),
                                     nameLabel.centerYAnchor.constraint(equalTo: nameView.centerYAnchor)])
        
    }
    
    func configure(_ character: Character) {
        
  
        nameLabel.text = character.name
        guard let thumbnail = character.thumbnail else { return }
        let url = "\(thumbnail.path).\(thumbnail.ext)"
        self.thumbnailImageView.sd_setImage(with: URL(string: url))
    }

}
