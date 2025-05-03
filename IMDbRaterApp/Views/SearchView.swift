//
//  SearchView.swift
//  IMDbRaterApp
//


import SwiftUI

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Sök efter film eller serie...", text: $viewModel.query)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Sök") {
                        Task { await viewModel.search() }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()

                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List(viewModel.results) { movie in
                        NavigationLink(destination: RatingView(movie: movie)) {
                            HStack {
                                AsyncImage(url: URL(string: movie.poster)) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 50, height: 75)
                                .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text(movie.title).bold()
                                    Text(movie.year).foregroundColor(.gray)
                                    if let rating = movie.imdbRating {
                                        Text("IMDb-betyg: \(rating)")
                                            .font(.caption)
                                            .foregroundColor(.yellow)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("IMDb")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.yellow)
                }
            }
            
            
        }
    }
}


#Preview {
    SearchView()
}
