//
//  RatingView.swift
//  IMDbRaterApp
//
//  Created by Serdar Celiker on 2025-05-03.
//

import SwiftUI

import SwiftUI

struct RatingView: View {
    let movie: Movie
    @State private var selectedRating: Int = 0
    @State private var showToast = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: movie.poster)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                        .shadow(radius: 4)
                } placeholder: {
                    Color.gray.frame(height: 300)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(movie.title)
                        .font(.title)
                        .bold()

                    Text("\(movie.year)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    if let genre = movie.genre {
                        Text(genre)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    if let plot = movie.plot {
                        Text(plot)
                            .font(.body)
                            .padding(.top, 8)
                    }

                    Text("Sätt ditt betyg:")
                        .font(.headline)
                        .padding(.top)

                    HStack(spacing: 10) {
                        ForEach(1...5, id: \.self) { star in
                            Image(systemName: selectedRating >= star ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    selectedRating = star
                                }
                        }
                    }

                    Button(action: {
                        let rating = Rating(movie: movie, rating: selectedRating)
                        RatingsManager.shared.saveRating(rating)
                        showToast = true

                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            showToast = false
                            dismiss()
                        }
                    }) {
                        Text("Spara betyg")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(selectedRating > 0 ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(selectedRating == 0)
                    .padding(.top)
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .overlay(
            Group {
                if showToast {
                    ToastView(message: "Betyg sparat!")
                }
            },
            alignment: .top
        )
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    RatingView(movie: Movie(from: .init(title: "Test", year: "2020", imdbID: "123", type: "movie", poster: "))") ))
}
