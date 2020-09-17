//
//  ButtonsView.swift
//  The Movie
//
//  Created by Marcelo Silva Honorio on 17/09/20.
//  Copyright © 2020 Mhonorio92. All rights reserved.
//

import Foundation
import UIKit

class ButtonsView: UIView, ViewCodePrococol {
    
    lazy var likeLabel: UILabel = {
        return UILabel()
    }()
    
    lazy var addToListLabel: UILabel = {
        return UILabel()
    }()
    
    var status: Bool! = true
    
    func setup() {
        viewCodeSetup()
    }
    
    private func setupFavoriteButton() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(chageButtonState))
        gesture.numberOfTapsRequired = 1
        likeLabel.addGestureRecognizer(gesture)
    }
    
    @objc func chageButtonState() {
        if status {
            likeLabel.text = ConstantLiterals.kLiked
            likeLabel.backgroundColor = .white
        } else {
            likeLabel.text = ConstantLiterals.kWillLike
            likeLabel.backgroundColor = .black
        }
        status = status == true ? false : true
    }
    
    func viewCodeHierarchySetup() {
        addSubview(likeLabel)
        addSubview(addToListLabel)
    }
    
    func viewCodeConstraintSetup() {
        DispatchQueue.main.async {
            self.likeLabel.translatesAutoresizingMaskIntoConstraints = false
            self.likeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: ConstantNumber.kCGFloat16).isActive = true
            self.likeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ConstantNumber.kCGFloat16).isActive = true
            self.likeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantNumber.kCGFloat16N).isActive = true
            
            self.addToListLabel.translatesAutoresizingMaskIntoConstraints = false
            self.addToListLabel.topAnchor.constraint(equalTo: self.likeLabel.bottomAnchor, constant: ConstantNumber.kCGFloat16).isActive = true
            self.addToListLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ConstantNumber.kCGFloat16).isActive = true
            self.addToListLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantNumber.kCGFloat16N).isActive = true
            self.addToListLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: ConstantNumber.kCGFloat16N).isActive = true
        }
    }
    
    func viewCodeThemeSetup() {
        self.backgroundColor = .black
        likeLabel.backgroundColor = .black
        likeLabel.layer.borderWidth = ConstantNumber.kCGFloat1
        likeLabel.layer.cornerRadius = ConstantNumber.kCGFloat4
        likeLabel.layer.borderColor = UIColor.white.cgColor
        addToListLabel.backgroundColor = .black
        addToListLabel.layer.borderWidth = ConstantNumber.kCGFloat1
        addToListLabel.layer.cornerRadius = ConstantNumber.kCGFloat4
        addToListLabel.layer.borderColor = UIColor.white.cgColor
    }
    
    func viewCodeAdditionalSetup() {
        setupFavoriteButton()
        likeLabel.isUserInteractionEnabled = true
        likeLabel.text = ConstantLiterals.kWillLike
        addToListLabel.text = ConstantLiterals.kAddToList
    }
}
