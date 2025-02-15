//
//  MainView.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 08/02/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MoviesView()
                .tabItem {
                    Label("Movies", systemImage: "movieclapper.fill")
                }
            Text("Map")
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            Text("Adjusts")
                .tabItem {
                    Label("Adjusts", systemImage: "gearshape.fill")
                }
        }
    }
}

#Preview {
    MainView()
}
