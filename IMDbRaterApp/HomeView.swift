//
//  ContentView.swift
//  IMDbRaterApp
//
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("Sök", systemImage: "magnifyingglass")
                }

            MyRatingsView()
                .tabItem {
                    Label("Mina Betyg", systemImage: "star.fill")
                }
        }
    }
}

#Preview {
    HomeView()
}
