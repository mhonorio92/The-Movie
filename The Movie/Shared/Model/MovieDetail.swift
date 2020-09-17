//
//  MovieDetail.swift
//  The Movie
//
//  Created by Marcelo Silva Honorio on 15/09/20.
//  Copyright © 2020 Mhonorio92. All rights reserved.
//

import Foundation

struct MovieDetailResponse: Codable {
    let title: String
    let likes: Int
    let views: Float
    let collection: MovieCollection
    let movieId: Int
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case likes = "vote_count"
        case views = "popularity"
        case collection = "belongs_to_collection"
        case movieId = "id"
    }
}

struct MovieCollection: Codable {
    let name: String
    let imagePath: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imagePath = "poster_path"
    }
}
