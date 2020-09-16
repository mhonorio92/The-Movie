//
//  MovieDetailViewModel.swift
//  The Movie
//
//  Created by Marcelo Silva Honorio on 15/09/20.
//  Copyright © 2020 Mhonorio92. All rights reserved.
//

import Foundation

class MovieDetailViewModel {
        
    func getMainMovie() {
        TMDBAPI.loadDetail(requiredMovie: "24428") { (response) in
            print(response)
        }
    }
    
}
