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
        HStack(spacing: 23) {
            if let image = movie.image,
               let uiImage = UIImage(data: image) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 80)
                    .cornerRadius(8)
                    .shadow(radius: 4, x: 2, y: 2)
            } else {
                Image(systemName: "movieclapper")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color.gray.opacity(0.3))
                    .frame(width: 50, height: 80)
            }
            
            Text(movie.title)
            
            Spacer()
        }
    }
}

#Preview {
    MovieListingRowView(
        movie: Movie(
            title: "The Matrix",
            categories: "Action, Sci-Fi",
            duration: "2h 16m",
            rating: 7.9,
            summary: "A hacker discovers the true nature of reality and his role in a war against its controllers.",
            image: nil
        )
    )
}
