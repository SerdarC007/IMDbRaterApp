//
//  MovieSearchResult.swift
//  IMDbRaterApp


import Foundation

struct MovieSearchResult: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"

    }
}

struct SearchResponse: Codable {
    let search: [MovieSearchResult]

    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}
