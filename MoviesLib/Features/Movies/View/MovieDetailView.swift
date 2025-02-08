//
//  MovieDetailView.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 08/02/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    var body: some View {
        VStack(spacing: 10) {

            poster
            VStack(alignment: .leading) {
                title
                rating
                categories
                playButton
                MovieSummaryView(summary: movie.summary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Spacer()
        }
    }
    
    // MARK : - Poster
    var poster: some View {
        Image(movie.image)
            .resizable()
            .scaledToFill()
            .frame(height: 400)
            .clipped()
        
    }

    // MARK : - Title
    var title: some View {
        Text(movie.title)
                .font(.title)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .multilineTextAlignment(.leading)
    }

    // MARK : - Rating
    var rating: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            
            Text("\(String(format: "%.1f", movie.rating))")
            
            Spacer()
            
            ZStack {
                Circle()
                    .frame(width: 34)
                    .foregroundStyle(Color.pink.opacity(0.3))
                Image(systemName: "heart.fill")
                    .foregroundColor(.white)
            }
        }
    }

    // MARK : - Categories
    var categories: some View {
        Text(movie.categories)
    }

    // MARK : - Play Button
    var playButton: some View {
        Button {
            print("Play trailer")
        } label: {
            HStack {
                Image(systemName: "play.fill")
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(60)
                
                Text("Trailer")
                    .fontWeight(.semibold)
                    .padding(.trailing)
                    .foregroundColor(.primary)
            }
            .padding(3)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(40)
        }
    }

    // MARK : - Summary
    var summary: some View {
        Text(movie.summary)
    }
}

#Preview {
    MovieDetailView(
            movie: Movie(
            title: "The Matrix",
            categories: "Action, Sci-Fi",
            duration: "2h 16m",
            rating: 7.9,
            summary: "A hacker discovers the true nature of reality and his role in a war against its controllers.",
            image: "matrix"
        )
    )
}
