//
//  SimilarMovies.swift
//  The Movie
//
//  Created by Marcelo Silva Honorio on 16/09/20.
//  Copyright © 2020 Mhonorio92. All rights reserved.
//

import Foundation

struct SimilarMovies: Codable {
    let titles: [Movies]
    
    enum CodingKeys: String, CodingKey {
        case titles = "results"
    }
}

struct Movies: Codable {
    let title: String
    let date: String
    let genre: [Int]
    let imagePath: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case date = "release_date"
        case genre = "genre_ids"
        case imagePath = "poster_path"
    }
}
