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
        
    var movieData: MovieDetailResponse?
    var status: Bool! = true
    
    func setup(movieData: MovieDetailResponse?) {
        self.movieData = movieData
        viewCodeSetup()
    }
    
    private func setupFavoriteButton() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(chageButtonState))
        gesture.numberOfTapsRequired = ConstantNumber.kInteger1
        favoriteLabel.addGestureRecognizer(gesture)
    }
    
    @objc func chageButtonState() {
        if status {
            favoriteLabel.text = ConstantLiterals.kFullHeart
        } else {
            favoriteLabel.text = ConstantLiterals.kEmptyHeart
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
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ConstantNumber.kCGFloat16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: ConstantNumber.kCGFloat16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantNumber.kCGFloat16N).isActive = true
        
        favoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantNumber.kCGFloat16N).isActive = true
        favoriteLabel.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor).isActive = true
        
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ConstantNumber.kCGFloat16).isActive = true
        likesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ConstantNumber.kCGFloat8).isActive = true
        likesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: ConstantNumber.kCGFloat16N).isActive = true
        
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.leftAnchor.constraint(equalTo: likesLabel.rightAnchor, constant: ConstantNumber.kCGFloat16).isActive = true
        viewsLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantNumber.kCGFloat16N).isActive = true
        viewsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: ConstantNumber.kCGFloat16N).isActive = true
        
    }
    
    func viewCodeThemeSetup() {
        self.backgroundColor = .clear
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: ConstantNumber.kCGFloat36)
        titleLabel.numberOfLines = ConstantNumber.kIntegerZero
        titleLabel.text = movieData?.title
        favoriteLabel.textColor = .white
        favoriteLabel.font = UIFont.systemFont(ofSize: ConstantNumber.kCGFloat24)
        favoriteLabel.isUserInteractionEnabled = true
        setupFavoriteButton()
        favoriteLabel.text = ConstantLiterals.kEmptyHeart
        likesLabel.textColor = .red
        likesLabel.text = "\(ConstantLiterals.kFullHeart) \(movieData?.likes ?? ConstantNumber.kIntegerZero)\(ConstantLiterals.kLikes)"
        viewsLabel.textColor = .red
        viewsLabel.text = "\(movieData?.views ?? Float(ConstantNumber.kIntegerZero))\(ConstantLiterals.kViews)"
    }
}

