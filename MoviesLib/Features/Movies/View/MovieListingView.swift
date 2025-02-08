//
//  MovieListingView.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 08/02/25.
//

import SwiftUI

struct MovieListingView: View {
    var movies: [Movie] = []
    
    var body: some View {
        List {
            ForEach(movies) { movie in
                NavigationLink(value: NavigationScreen.detail(movie)) {
                    MovieListingRowView(movie: movie)
                }
            }
        }
    }
}

#Preview {
    MovieListingView()
}
