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
    var similarMovies: SimilarMovies?
    
    init(delegate: MovieDetailDelegate?) {
        self.delegate = delegate
    }
    
    func getMainMovie() {
        TMDBAPI.loadDetail(type: MovieDetailResponse.self, requiredMovie: "24428", success: { (response) in
            self.mainMovie = response
            self.delegate?.didLoadedMainMovieInfo()
            self.getSimilarMovies(similarOf: response.movieId)
        }) { (failure) in
            print(failure ?? ConstantLiterals.kError)
        }
    }
    
    func getSimilarMovies(similarOf: Int) {
        TMDBAPI.loadSimilars(type: SimilarMovies.self, similarOf: String(similarOf), success: { (response) in
            self.similarMovies = response
            self.delegate?.didLoadedSimilarMovies()
        }) { (failure) in
            print(failure ?? ConstantLiterals.kError)
        }
    }
    
}
