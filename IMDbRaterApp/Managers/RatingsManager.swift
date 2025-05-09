//
//  RatingsManager.swift
//  IMDbRaterApp

import Foundation

class RatingsManager {
    static let shared = RatingsManager()
    private let key = "savedRatings"

    private init() {}

    func saveRating(_ newRating: Rating) {
        var currentRatings = loadRatings()

        // Remove existing rating for the same IMDb ID if it exists
        currentRatings.removeAll { $0.movie.imdbID == newRating.movie.imdbID }

        // Add the new one
        currentRatings.append(newRating)

        if let encoded = try? JSONEncoder().encode(currentRatings) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    func loadRatings() -> [Rating] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let ratings = try? JSONDecoder().decode([Rating].self, from: data) else {
            return []
        }
        return ratings
    }
    func deleteRating(_ rating: Rating) {
        var currentRatings = loadRatings()
        currentRatings.removeAll { $0.id == rating.id }

        if let encoded = try? JSONEncoder().encode(currentRatings) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

}
