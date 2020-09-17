//
//  HeaderTitleTableViewCell.swift
//  The Movie
//
//  Created by Marcelo Silva Honorio on 16/09/20.
//  Copyright © 2020 Mhonorio92. All rights reserved.
//

import UIKit

class HeaderTitleTableViewCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        return UILabel()
    }()
    
    lazy var favoriteLabel: UILabel = {
        return UILabel()
    }()
    
    lazy var likesLabel: UILabel = {
        return UILabel()
    }()
    
    lazy var viewsLabel: UILabel = {
        return UILabel()
    }()
    
    private static let baseImagePath = "https://image.tmdb.org/t/p/w500"
    
    var movieData: MovieDetailResponse?
    var status: Bool! = true
    
    func setup(movieData: MovieDetailResponse?) {
        self.movieData = movieData
        viewCodeSetup()
    }
    
    private func setupFavoriteButton() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(chageButtonState))
        gesture.numberOfTapsRequired = 1
        favoriteLabel.addGestureRecognizer(gesture)
    }
    
    @objc func chageButtonState() {
        if status {
            favoriteLabel.text = "♥"
        } else {
            favoriteLabel.text = "♡"
        }
        status = status == true ? false : true
    }
}

extension HeaderTitleTableViewCell: ViewCodePrococol {
    func viewCodeHierarchySetup() {
        addSubview(titleLabel)
        addSubview(favoriteLabel)
        addSubview(likesLabel)
        addSubview(viewsLabel)
    }
    
    func viewCodeConstraintSetup() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        
        favoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        favoriteLabel.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor).isActive = true
        
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        likesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        likesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.leftAnchor.constraint(equalTo: likesLabel.rightAnchor, constant: 16).isActive = true
        viewsLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        viewsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        
    }
    
    func viewCodeThemeSetup() {
        self.backgroundColor = .clear
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 36)
        titleLabel.numberOfLines = 0
        titleLabel.text = movieData?.title
        favoriteLabel.textColor = .white
        favoriteLabel.font = UIFont.systemFont(ofSize: 24)
        favoriteLabel.isUserInteractionEnabled = true
        setupFavoriteButton()
        favoriteLabel.text = "♡"
        likesLabel.textColor = .red
        likesLabel.text = "♥\(movieData?.likes ?? 0) Curtidas"
        viewsLabel.textColor = .red
        viewsLabel.text = "\(movieData?.views ?? 0)k Visualizações"
    }
}

