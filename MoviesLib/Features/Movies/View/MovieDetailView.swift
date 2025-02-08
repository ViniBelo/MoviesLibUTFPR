//
//  MovieDetailView.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 08/02/25.
//

import SwiftUI

struct MovieDetailView: View {
    var body: some View {
        VStack(spacing: 10) {

            poster
            VStack(alignment: .leading) {
                title
                rating
                categories
                playButton
                MovieSummaryView()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

// MARK : - Poster
var poster: some View {
    Image("avengers")
        .resizable()
        .scaledToFill()
        .frame(height: 400)
        .clipped()
    
}

var title: some View {
        Text("Avengers")
            .font(.title)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .multilineTextAlignment(.leading)
}

var rating: some View {
    HStack {
        Image(systemName: "star.fill")
            .foregroundColor(.yellow)
        
        Text("10.0")
        
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
    Text("Sci-Fi, Action")
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
    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nullam eget metus id nisl malesuada condimentum. Nam viverra fringilla erat, ut fermentum nunc feugiat eu.")
}

#Preview {
    MovieDetailView()
}
