//
//  SimilarMovieCollectionReusableView.swift
//  The Movie
//
//  Created by Marcelo Silva Honorio on 15/09/20.
//  Copyright © 2020 Mhonorio92. All rights reserved.
//

import UIKit

class SimilarMovieCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "sampleImage"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    lazy var titleLabel: UILabel = {
        return UILabel()
    }()
    
    lazy var yearLabel: UILabel = {
        return UILabel()
    }()
    
    lazy var genreLabel: UILabel = {
        return UILabel()
    }()
    
    lazy var separatorLine: UILabel = {
        return UILabel()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewCodeSetup()
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SimilarMovieCollectionViewCell: ViewCodePrococol {
    func viewCodeHierarchySetup() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(yearLabel)
        contentView.addSubview(genreLabel)
        contentView.addSubview(separatorLine)
    }
    
    func viewCodeConstraintSetup() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16).isActive = true
        yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.leftAnchor.constraint(equalTo: yearLabel.rightAnchor, constant: 16).isActive = true
        genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        separatorLine.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16).isActive = true
        separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func viewCodeThemeSetup() {
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.text = "O Filme"
        yearLabel.textColor = .white
        yearLabel.text = "2000"
        genreLabel.textColor = .red
        genreLabel.text = "Ação, Comédia"
        separatorLine.backgroundColor = .darkGray
    }
}
