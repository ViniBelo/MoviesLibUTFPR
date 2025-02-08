//
//  Movie.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 08/02/25.
//

import Foundation
import SwiftData

@Model
class Movie {
    var id: String {
        UUID().uuidString
    }
    
    var title: String
    var categories: String
    var duration: String
    var rating: Double
    var summary: String
    var image: Data?
    
    init(
        title: String = "",
        categories: String = "",
        duration: String = "",
        rating: Double = 0.0,
        summary: String = "",
        image: Data? = nil
    ) {
        self.title = title
        self.categories = categories
        self.duration = duration
        self.rating = rating
        self.summary = summary
        self.image = image
    }
}
