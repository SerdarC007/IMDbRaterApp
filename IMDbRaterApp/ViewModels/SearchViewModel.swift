//
//  SearchViewModel.swift
//  IMDbRaterApp


import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    @Published var query = ""
    @Published var results: [Movie] = []
    @Published var isLoading = false

    func search() async {
        guard !query.isEmpty else { return }
        isLoading = true
        do {
            let basicResults = try await OMDBService.shared.searchMovies(query: query)
            var fullResults: [Movie] = []
            for result in basicResults {
                do {
                    let movie = try await OMDBService.shared.getMovieDetails(imdbID: result.imdbID)
                    fullResults.append(movie)
                } catch {
                    print("Kunde inte hämta detaljer för \(result.title)")
                }
            }
            results = fullResults
        } catch {
            print("Sökfel: \(error)")
        }
        isLoading = false
    }
}
