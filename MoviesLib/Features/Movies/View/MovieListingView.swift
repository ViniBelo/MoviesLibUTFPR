//
//  MovieListingView.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 08/02/25.
//

import SwiftUI
import SwiftData

struct MovieListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var movies: [Movie]
    
    init(searchString: String) {
        _movies = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.title.localizedStandardContains(searchString)
            }
        }, sort: [SortDescriptor(\Movie.title)])
    }
    
    var body: some View {
        List {
            ForEach(movies) { movie in
                NavigationLink(value: NavigationScreen.detail(movie)) {
                    MovieListingRowView(movie: movie)
                }
            }
            .onDelete(perform: deleteMovie)
        }
    }
    
    func deleteMovie(_ indexSet: IndexSet) {
        for index in indexSet {
            let movie = movies[index]
            modelContext.delete(movie)
        }
    }
}

#Preview {
    MovieListingView(searchString: "")
}
