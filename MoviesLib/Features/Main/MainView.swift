//
//  MainView.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 08/02/25.
//

import SwiftUI

struct MainView: View {
    @AppStorage(AppStorageKeys.color) private var color = 0
    var body: some View {
        TabView {
            MoviesView()
                .tabItem {
                    Label("Movies", systemImage: "movieclapper.fill")
                }
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Adjusts", systemImage: "gearshape.fill")
                }
        }
        .tint(colorFor(index: color))
    }
    
    private func colorFor(index: Int) -> Color {
        switch index {
        case 0:
            return .accentColor
        case 1:
            return .orange
        case 2:
            return .purple
        default:
            return .accentColor
        }
    }
}

#Preview {
    MainView()
}
