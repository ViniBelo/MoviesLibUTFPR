//
//  MovieListingRowView.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 08/02/25.
//

import SwiftUI

struct MovieListingRowView: View {
    let movie: Movie
    
    var body: some View {
        HStack {
            Image(movie.image)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(8)
                .shadow(radius: 4)
            
            Text(movie.title)
            
            Spacer()
        }
    }
}

#Preview {
    MovieListingRowView(
        movie: <#T##Movie#>(
            title: "The Matrix",
            categories: "ajdijaow",
            duration: "ajdijaow",
            rating: 7.9,
            summary: "ajdijaow",
            image: "ajdijaow"
        )
    )
}
