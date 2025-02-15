//
//  MoviesView.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 08/02/25.
//

import SwiftUI

enum NavigationScreen: Hashable {
    case detail(Movie)
    case form(Movie?)
}

struct MoviesView: View {
    @State private var path = NavigationPath()
    @State private var searchString: String = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            MovieListingView(searchString: searchString)
                .navigationTitle("Movies")
                .searchable(text: $searchString, prompt: "Type a movie's name")
                .navigationDestination(for: NavigationScreen.self) { destination in
                    switch destination {
                        case .detail(let movie):
                            MovieDetailView(movie: movie)
                        case .form(let movie):
                            MovieFormView(movie: movie, path: $path)
                    }
                }
                .toolbar {
                    Button("", systemImage: "plus.circle.fill") {
                        path = NavigationPath([NavigationScreen.form(nil)])
                    }
                }
        }
    }
}

#Preview {
    MoviesView()
}
