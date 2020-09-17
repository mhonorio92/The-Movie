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
            case ConstantNumber.kInteger28:
                genresTitles = genresTitles + ConstantGenres.kAction
            case ConstantNumber.kInteger12:
                genresTitles = genresTitles + ConstantGenres.kAdventure
            case ConstantNumber.kInteger16:
                genresTitles = genresTitles + ConstantGenres.kAnimation
            case ConstantNumber.kInteger35:
                genresTitles = genresTitles + ConstantGenres.kComedy
            case ConstantNumber.kInteger80:
                genresTitles = genresTitles + ConstantGenres.kCrime
            case ConstantNumber.kInteger99:
                genresTitles = genresTitles + ConstantGenres.kDocumentary
            case ConstantNumber.kInteger18:
                genresTitles = genresTitles + ConstantGenres.kDrama
            case ConstantNumber.kInteger10751:
                genresTitles = genresTitles + ConstantGenres.kFamily
            case ConstantNumber.kInteger14:
                genresTitles = genresTitles + ConstantGenres.kFantasy
            case ConstantNumber.kInteger36:
                genresTitles = genresTitles + ConstantGenres.kHistory
            case ConstantNumber.kInteger27:
                genresTitles = genresTitles + ConstantGenres.kHorror
            case ConstantNumber.kInteger10402:
                genresTitles = genresTitles + ConstantGenres.kMusic
            case ConstantNumber.kInteger9648:
                genresTitles = genresTitles + ConstantGenres.kMistery
            case ConstantNumber.kInteger10749:
                genresTitles = genresTitles + ConstantGenres.kRomance
            case ConstantNumber.kInteger878:
                genresTitles = genresTitles + ConstantGenres.kFScientific
            case ConstantNumber.kInteger10770:
                genresTitles = genresTitles + ConstantGenres.kTVMovie
            case ConstantNumber.kInteger53:
                genresTitles = genresTitles + ConstantGenres.kThriller
            case ConstantNumber.kInteger10752:
                genresTitles = genresTitles + ConstantGenres.kWar
            case ConstantNumber.kInteger37:
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
        listImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: ConstantNumber.kCGFloat16).isActive = true
        listImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        listImageView.heightAnchor.constraint(equalToConstant: ConstantNumber.kCGFloat75).isActive = true
        listImageView.widthAnchor.constraint(equalToConstant: ConstantNumber.kCGFloat50).isActive = true
        listImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: ConstantNumber.kCGFloat8).isActive = true
        listImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: ConstantNumber.kCGFloat8N).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: listImageView.rightAnchor, constant: ConstantNumber.kCGFloat12).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantNumber.kCGFloat16N).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: ConstantNumber.kCGFloat16).isActive = true
        
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.leftAnchor.constraint(equalTo: listImageView.rightAnchor, constant: ConstantNumber.kCGFloat16).isActive = true
        yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ConstantNumber.kCGFloat8).isActive = true
        
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.leftAnchor.constraint(equalTo: yearLabel.rightAnchor, constant: ConstantNumber.kCGFloat16).isActive = true
        genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ConstantNumber.kCGFloat8).isActive = true
        
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        separatorLine.leftAnchor.constraint(equalTo: listImageView.rightAnchor, constant: ConstantNumber.kCGFloat16).isActive = true
        separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor, constant: ConstantNumber.kCGFloat16N).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: ConstantNumber.kCGFloat1).isActive = true
        separatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func viewCodeThemeSetup() {
        self.backgroundColor = .black
        listImageView.loadImage("\(ConstantURL.kBaseImagePath)\(currentSimilar?.imagePath ?? ConstantLiterals.kEmpty)")
        titleLabel.textColor = .white
        titleLabel.numberOfLines = ConstantNumber.kIntegerZero
        titleLabel.font = UIFont.boldSystemFont(ofSize: ConstantNumber.kCGFloat18)
        titleLabel.text = currentSimilar?.title ?? ConstantLiterals.kEmpty
        yearLabel.textColor = .white
        yearLabel.text = currentSimilar?.date.dateFormatter() ?? ConstantLiterals.kEmpty
        genreLabel.textColor = .red
        genreLabel.numberOfLines = ConstantNumber.kIntegerZero
        if let genre = currentSimilar?.genre {
            genreLabel.text = getGenres(genres: Array(genre.prefix(ConstantNumber.kInteger2)))
        }
        separatorLine.backgroundColor = .darkGray
    }
}
