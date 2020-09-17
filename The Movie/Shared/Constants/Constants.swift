//
//  Constants.swift
//  The Movie
//
//  Created by Marcelo Silva Honorio on 17/09/20.
//  Copyright © 2020 Mhonorio92. All rights reserved.
//

import Foundation
import UIKit

struct ConstantNumber {
    static let kInteger28 = 28
    static let kInteger12 = 12
    static let kInteger16 = 16
    static let kInteger35 = 35
    static let kInteger80 = 80
    static let kInteger99 = 99
    static let kInteger18 = 18
    static let kInteger10751 = 10751
    static let kInteger14 = 14
    static let kInteger36 = 36
    static let kInteger27 = 27
    static let kInteger10402 = 10402
    static let kInteger9648 = 9648
    static let kInteger10749 = 10749
    static let kInteger878 = 878
    static let kInteger10770 = 10770
    static let kInteger53 = 53
    static let kInteger10752 = 10752
    static let kInteger37 = 37
    static let kIntegerZero = 0
    static let kCGFloatZero: CGFloat = 0
    static let kInteger1 = 1
    static let kInteger2 = 2
    static let kCGFloat1: CGFloat = 1
    static let kCGFloat4: CGFloat = 4
    static let kCGFloat8: CGFloat = 8
    static let kCGFloat8N: CGFloat = -8
    static let kCGFloat12: CGFloat = 12
    static let kCGFloat16: CGFloat = 16
    static let kCGFloat16N: CGFloat = -16
    static let kCGFloat18: CGFloat = 18
    static let kCGFloat24: CGFloat = 24
    static let kCGFloat36: CGFloat = 36
    static let kCGFloat50: CGFloat = 50
    static let kCGFloat75: CGFloat = 75
    static let kCGFloat300: CGFloat = 300
    static let kCGFloat300N: CGFloat = -300
    static let kCGFloat700: CGFloat = 700
}

struct ConstantTableViewIdentifier {
    static let kReuseIdentifier = "SimilarMovieCollectionReusableView"
    static let kReuseIdentifierHeaderTitle = "HeaderTitleTableViewCell"
}

struct ConstantURL {
    static let kBaseImagePath = "https://image.tmdb.org/t/p/w500"
    static let kBasePath = "https://api.themoviedb.org/3/movie/"
    static let kPortugueseLanguageQuery = "&language=pt-BR"
    static let kPageOfSimilarMovies = "&page=1"
    static let kAPIKey = "?api_key=307e043272896e80df61749d6f9242c4"
}

struct ConstantGenres {
    static let kAction = " Ação,"
    static let kAdventure = " Aventura,"
    static let kAnimation = " Animação,"
    static let kComedy = " Comédia,"
    static let kCrime = " Crime,"
    static let kDocumentary = " Documentário,"
    static let kDrama = " Drama,"
    static let kFamily = " Família,"
    static let kFantasy = " Fantasia,"
    static let kHistory = " História,"
    static let kHorror = " Terror,"
    static let kMusic = " Musical,"
    static let kMistery = " Mistério,"
    static let kRomance = " Romance,"
    static let kFScientific = " Ficção científica,"
    static let kTVMovie = " Filme de TV,"
    static let kThriller = " Suspense,"
    static let kWar = " Guerra,"
    static let kWestern = " Ocidental,"
    static let kEmpty = ""
}

struct ConstantLiterals {
    static let kEmpty = ""
    static let kEmptyHeart = "♡"
    static let kFullHeart = "♥"
    static let kLiked = "♥ Curtido"
    static let kWillLike = "♡ Curtir"
    static let kViews = "k Visualizações"
    static let kLikes = " Curtidas"
    static let kAddToList = "Adicionar às Minhas Listas"
    static let kError = "Error"
}
