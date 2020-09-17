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
        return UIImageView()
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
        
    var currentSimilar: Movies?
    
    func setup(currentSimilar: Movies?) {
        self.currentSimilar = currentSimilar
        viewCodeSetup()
    }
 
    func getGenres(genres: [Int]) -> String {
        var genresTitles = ConstantGenres.kEmpty
        for one in genres {
            switch one {
            case 28:
                genresTitles = genresTitles + ConstantGenres.kAction
            case 12:
                genresTitles = genresTitles + ConstantGenres.kAdventure
            case 16:
                genresTitles = genresTitles + ConstantGenres.kAnimation
            case 35:
                genresTitles = genresTitles + ConstantGenres.kComedy
            case 80:
                genresTitles = genresTitles + ConstantGenres.kCrime
            case 99:
                genresTitles = genresTitles + ConstantGenres.kDocumentary
            case 18:
                genresTitles = genresTitles + ConstantGenres.kDrama
            case 10751:
                genresTitles = genresTitles + ConstantGenres.kFamily
            case 14:
                genresTitles = genresTitles + ConstantGenres.kFantasy
            case 36:
                genresTitles = genresTitles + ConstantGenres.kHistory
            case 27:
                genresTitles = genresTitles + ConstantGenres.kHorror
            case 10402:
                genresTitles = genresTitles + ConstantGenres.kMusic
            case 9648:
                genresTitles = genresTitles + ConstantGenres.kMistery
            case 10749:
                genresTitles = genresTitles + ConstantGenres.kRomance
            case 878:
                genresTitles = genresTitles + ConstantGenres.kFScientific
            case 10770:
                genresTitles = genresTitles + ConstantGenres.kTVMovie
            case 53:
                genresTitles = genresTitles + ConstantGenres.kThriller
            case 10752:
                genresTitles = genresTitles + ConstantGenres.kWar
            case 37:
                genresTitles = genresTitles + ConstantGenres.kWestern
            default:
                genresTitles = genresTitles + ConstantGenres.kEmpty
            }
        }
        genresTitles = String(genresTitles.dropLast())
        
        return genresTitles
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
        listImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        listImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        listImageView.heightAnchor.constraint(equalToConstant: 75.0).isActive = true
        listImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        listImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        listImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: listImageView.rightAnchor, constant: 12).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.leftAnchor.constraint(equalTo: listImageView.rightAnchor, constant: 16).isActive = true
        yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.leftAnchor.constraint(equalTo: yearLabel.rightAnchor, constant: 16).isActive = true
        genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        separatorLine.leftAnchor.constraint(equalTo: listImageView.rightAnchor, constant: 16).isActive = true
        separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func viewCodeThemeSetup() {
        self.backgroundColor = .black
        listImageView.loadImage("\(ConstantURL.kBaseImagePath)\(currentSimilar?.imagePath ?? "")")
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.text = currentSimilar?.title ?? ""
        yearLabel.textColor = .white
        yearLabel.text = currentSimilar?.date.dateFormatter() ?? ""
        genreLabel.textColor = .red
        genreLabel.numberOfLines = 0
        if let genre = currentSimilar?.genre {
            genreLabel.text = getGenres(genres: Array(genre.prefix(2)))
        }
        separatorLine.backgroundColor = .darkGray
    }
}
