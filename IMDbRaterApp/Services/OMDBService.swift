//
//  OMDBService.swift
//  IMDbRaterApp
//

import Foundation

class OMDBService {
    static let shared = OMDBService()
    private let baseURL = "https://www.omdbapi.com/"
    //private let apiKey = "din_api_nyckel"

    func searchMovies(query: String) async throws -> [MovieSearchResult] {
        guard let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "\(baseURL)?apikey=\(Constants.apiKey)&s=\(encoded)") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(SearchResponse.self, from: data)
        return result.search
    }

    func getMovieDetails(imdbID: String) async throws -> Movie {
        guard let url = URL(string: "\(baseURL)?apikey=\(Constants.apiKey)&i=\(imdbID)&plot=short") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Movie.self, from: data)
    }
}
