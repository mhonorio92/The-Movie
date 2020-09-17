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
            likeLabel.text = "♥ Curtido"
            likeLabel.backgroundColor = .white
        } else {
            likeLabel.text = "♡ Curtir"
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
            self.likeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
            self.likeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
            self.likeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
            
            self.addToListLabel.translatesAutoresizingMaskIntoConstraints = false
            self.addToListLabel.topAnchor.constraint(equalTo: self.likeLabel.bottomAnchor, constant: 16).isActive = true
            self.addToListLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
            self.addToListLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
            self.addToListLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        }
    }
    
    func viewCodeThemeSetup() {
        self.backgroundColor = .black
        likeLabel.backgroundColor = .black
        likeLabel.layer.borderWidth = 1
        likeLabel.layer.cornerRadius = 4
        likeLabel.layer.borderColor = UIColor.white.cgColor
        addToListLabel.backgroundColor = .black
        addToListLabel.layer.borderWidth = 1
        addToListLabel.layer.cornerRadius = 4
        addToListLabel.layer.borderColor = UIColor.white.cgColor
    }
    
    func viewCodeAdditionalSetup() {
        setupFavoriteButton()
        likeLabel.isUserInteractionEnabled = true
        likeLabel.text = "♡ Curtir"
        addToListLabel.text = "Adicionar às Minhas Listas"
    }
}
