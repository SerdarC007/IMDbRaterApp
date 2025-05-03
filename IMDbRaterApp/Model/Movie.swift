//
//  Movie.swift
//  IMDbRaterApp
//
//  Created by Serdar Celiker on 2025-05-03.
//

struct Movie: Codable, Identifiable, Equatable {
    var id: String { imdbID }

    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
    let plot: String?
    let genre: String?
    let imdbRating: String?
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
        case plot = "Plot"
        case genre = "Genre"
        case imdbRating

    }

    init(from searchResult: MovieSearchResult) {
        self.title = searchResult.title
        self.year = searchResult.year
        self.imdbID = searchResult.imdbID
        self.type = searchResult.type
        self.poster = searchResult.poster
        self.plot = nil
        self.genre = nil
        self.imdbRating = nil
    }
}
