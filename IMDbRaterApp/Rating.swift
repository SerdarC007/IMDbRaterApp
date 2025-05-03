//
//  Rating.swift
//  IMDbRaterApp


import Foundation

struct Rating: Codable, Identifiable {
    var id: String { movie.id }
    let movie: Movie
    let rating: Int
}
