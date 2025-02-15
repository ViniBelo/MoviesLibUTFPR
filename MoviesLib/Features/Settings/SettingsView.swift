//
//  SettingsView.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 15/02/25.
//

import SwiftUI

enum AppStorageKeys {
    static let color: String = "color"
    static let autoplay: String = "autoplay"
    static let category: String = "category"
}

struct SettingsView: View {
    @AppStorage(AppStorageKeys.color) private var color: Int = 0
    @AppStorage(AppStorageKeys.autoplay) private var autoplay: Bool = false
    @AppStorage(AppStorageKeys.category) private var category: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Color schema") {
                    Picker("What's your favorite color?", selection: $color) {
                        Text("Blue")
                            .tag(0)
                        Text("Orange")
                            .tag(1)
                        Text("Purple")
                            .tag(2)
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Autoplay") {
                    HStack {
                        Image(systemName: "play.circle.fill")
                        Toggle("Play automatically", isOn: $autoplay)
                    }
                }
                
                Section("Categories") {
                    TextField("Type your favorite category", text: $category)
                }
            }
        }
        .navigationTitle("Adjusts")
    }
}

#Preview {
    SettingsView()
}
