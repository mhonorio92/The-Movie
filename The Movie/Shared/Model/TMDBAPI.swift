//
//  TMDBAPI.swift
//  The Movie
//
//  Created by Marcelo Silva Honorio on 16/09/20.
//  Copyright © 2020 Mhonorio92. All rights reserved.
//

import Foundation

enum APIError: Error {
    case badURL
    case taskError
    case noResponse
    case invalidStatusCode(Int)
    case noData
    case invalidJSON
    
    var errorMessage: String {
        switch self {
        case .badURL:
            return "URL inválida"
        default:
            return ""
        }
    }
}


class TMDBAPI {
    
    private static let basePath = "https://api.themoviedb.org/3/movie/"
    private static let portugueseLanguageQuery = "&language=pt-BR"
    private static let pageOfSimilarMovies = "&page=1"
    private static let APIKey = "?api_key=307e043272896e80df61749d6f9242c4"
    
    private static let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForRequest = 30
        configuration.httpMaximumConnectionsPerHost = 5
        return configuration
        
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    static func loadDetail(requiredMovie: String, onComplete: @escaping (Result<MovieDetailResponse, APIError>) -> Void) {
        
        let fullURL = "\(basePath)\(requiredMovie)\(APIKey)\(portugueseLanguageQuery)"
        
        guard let url = URL(string: fullURL) else {
            return onComplete(.failure(.badURL))
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                return onComplete(.failure(.taskError))
            }
            
            guard let response = response as? HTTPURLResponse else {
                return onComplete(.failure(.noResponse))
            }
            
            if !(200...299 ~= response.statusCode) {
                return onComplete(.failure(.invalidStatusCode(response.statusCode)))
            }
            
            guard let data = data else {
                return onComplete(.failure(.noData))
            }
            
            do {
                let movie = try JSONDecoder().decode(MovieDetailResponse.self, from: data)
                onComplete(.success(movie))
            } catch {
                return onComplete(.failure(.invalidJSON))
            }
        }
        task.resume()
        
    }
    
    static func getImage(imagePath: String, onComplete: @escaping (Result<MovieDetailResponse, APIError>) -> Void) {
        
    }
    
    private static func request(httpMethod: HTTPMethod, httpBody: MovieDetailResponse, onComplete: @escaping (Result<Void, APIError>) -> Void) {
        
        
        guard let url = URL(string: "\(basePath)") else {
            return onComplete(.failure(.badURL))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = try? JSONEncoder().encode(httpBody)
        
        session.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                return onComplete(.failure(.taskError))
            }
            
            guard let response = response as? HTTPURLResponse else {
                return onComplete(.failure(.noResponse))
            }
            
            if !(200...299 ~= response.statusCode) {
                return onComplete(.failure(.invalidStatusCode(response.statusCode)))
            }
            
            guard let _ = data else {
                return onComplete(.failure(.noData))
            }
            onComplete(.success(()))
        }.resume()
        
    }
}

enum HTTPMethod: String {
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    
}