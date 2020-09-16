//
//  MovieDetailViewModel.swift
//  The Movie
//
//  Created by Marcelo Silva Honorio on 15/09/20.
//  Copyright © 2020 Mhonorio92. All rights reserved.
//

import Foundation

class MovieDetailViewModel {
    
    var delegate: MovieDetailDelegate?
    var mainMovie: MovieDetailResponse?
    
    init(delegate: MovieDetailDelegate?) {
        self.delegate = delegate
    }
    
    func getMainMovie() {
        TMDBAPI.loadDetail(type: MovieDetailResponse.self, requiredMovie: "24428", success: { (response) in
            self.mainMovie = response
            self.delegate?.didLoadedMainMovieInfo()
            print(self.mainMovie ?? "")
        }) { (failure) in
            print(failure ?? "Error")
        }
    }
    
}
