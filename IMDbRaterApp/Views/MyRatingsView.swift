//
//  MyRatingsView.swift
//  IMDbRaterApp


import SwiftUI

import SwiftUI

struct MyRatingsView: View {
    @State private var ratings: [Rating] = []

    var body: some View {
        NavigationView {
            List {
                ForEach(ratings) { rating in
                    HStack(alignment: .top) {
                        AsyncImage(url: URL(string: rating.movie.poster)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 60, height: 90)
                        .cornerRadius(6)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(rating.movie.title)
                                .font(.headline)
                            Text("\(rating.movie.year)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text(rating.movie.genre ?? "")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            HStack(spacing: 2) {
                                ForEach(1...5, id: \.self) { i in
                                    Image(systemName: i <= rating.rating ? "star.fill" : "star")
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                    }
                    .padding(.vertical, 6)
                }
                .onDelete(perform: delete)

                if ratings.isEmpty {
                    Text("Du har inte betygsatt något ännu.")
                        .italic()
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Mina Betyg")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.yellow)
                }
            }
            .onAppear {
                ratings = RatingsManager.shared.loadRatings()
            }
            
        }
    }
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            let ratingToDelete = ratings[index]
            RatingsManager.shared.deleteRating(ratingToDelete)
        }
        ratings = RatingsManager.shared.loadRatings()
    }
}


#Preview {
    MyRatingsView()
}
