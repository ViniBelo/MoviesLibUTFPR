//
//  Movie.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 08/02/25.
//

import Foundation

struct Movie: Decodable, Identifiable {
    var id: String {
        UUID().uuidString
    }
    
    let title: String
    let categories: String
    let duration: String
    let rating: Double
    let summary: String
    let image: String
    
    var imageSmall: String {
        "\(image)small"
    }
}
