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
//        let iv = UIImageView(image: #imageLiteral(resourceName: "sampleImage"))
//        iv.contentMode = .scaleAspectFit
//        return iv
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
    
    let baseImagePath = "https://image.tmdb.org/t/p/w500"
    
    var currentSimilar: Movies?
    func setup(currentSimilar: Movies?) {
        self.currentSimilar = currentSimilar
        viewCodeSetup()
    }
 
    func getGenres(genres: [Int]) -> String {
        var genresTitles = ""
        for one in genres {
            switch one {
            case 28:
                genresTitles = genresTitles + " Ação,"
            case 12:
                genresTitles = genresTitles + " Aventura,"
            case 16:
                genresTitles = genresTitles + " Animação,"
            case 35:
                genresTitles = genresTitles + " Comédia,"
            case 80:
                genresTitles = genresTitles + " Crime,"
            case 99:
                genresTitles = genresTitles + " Documentário,"
            case 18:
                genresTitles = genresTitles + " Drama,"
            case 10751:
                genresTitles = genresTitles + " Família,"
            case 14:
                genresTitles = genresTitles + " Fantasia,"
            case 36:
                genresTitles = genresTitles + " História,"
            case 27:
                genresTitles = genresTitles + " Terror,"
            case 10402:
                genresTitles = genresTitles + " Musical,"
            case 9648:
                genresTitles = genresTitles + " Mistério,"
            case 10749:
                genresTitles = genresTitles + " Romance,"
            case 878:
                genresTitles = genresTitles + " Ficção científica,"
            case 10770:
                genresTitles = genresTitles + " Filme de TV,"
            case 53:
                genresTitles = genresTitles + " Suspense,"
            case 10752:
                genresTitles = genresTitles + " Guerra,"
            case 37:
                genresTitles = genresTitles + " Ocidental,"
            default:
                genresTitles = genresTitles + ""
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
        listImageView.loadImage("\(baseImagePath)\(currentSimilar?.imagePath ?? "")")
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
