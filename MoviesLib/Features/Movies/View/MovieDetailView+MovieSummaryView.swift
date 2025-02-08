//
//  MovieSummaryView.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 08/02/25.
//

import SwiftUI

extension MovieDetailView {
    struct MovieSummaryView: View {
        var body: some View {
            VStack(alignment: .leading) {
                Text("Synopsis")
                    .padding(.top)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                ScrollView {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nullam eget metus id nisl malesuada condimentum. Nam viverra fringilla erat, ut fermentum nunc feugiat eu.")
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .frame(width: .infinity)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(16)
            .padding(.vertical)
        }
    }
}
