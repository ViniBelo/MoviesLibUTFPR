//
//  MoviesLibApp.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 08/02/25.
//

import SwiftUI
import SwiftData

@main
struct MoviesLibApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: Movie.self)
    }
}
