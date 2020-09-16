//
//  SimilarMovieTableViewCell.swift
//  The Movie
//
//  Created by Marcelo Silva Honorio on 15/09/20.
//  Copyright © 2020 Mhonorio92. All rights reserved.
//

import UIKit

class SimilarMovieTableViewCell: UITableViewCell {
    
    lazy var listImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "sampleImage"))
        iv.contentMode = .scaleAspectFit
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
    
    private static let baseImagePath = "https://image.tmdb.org/t/p/w500"
    
    func setup() {
        viewCodeSetup()
    }
    
}

extension SimilarMovieTableViewCell: ViewCodePrococol {
    func viewCodeHierarchySetup() {
        addSubview(listImageView)
        addSubview(titleLabel)
        addSubview(yearLabel)
        addSubview(genreLabel)
        addSubview(separatorLine)
    }
    
    func viewCodeConstraintSetup() {
       
        listImageView.translatesAutoresizingMaskIntoConstraints = false
        listImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        listImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        listImageView.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        listImageView.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
        listImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        listImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: listImageView.rightAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.leftAnchor.constraint(equalTo: listImageView.rightAnchor, constant: 16).isActive = true
        yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.leftAnchor.constraint(equalTo: yearLabel.rightAnchor, constant: 16).isActive = true
        genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        separatorLine.leftAnchor.constraint(equalTo: listImageView.rightAnchor, constant: 16).isActive = true
        separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func viewCodeThemeSetup() {
        self.backgroundColor = .black
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
