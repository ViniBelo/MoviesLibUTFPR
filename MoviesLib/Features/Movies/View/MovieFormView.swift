//
//  MovieFormView.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 08/02/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct MovieFormView: View {
    @State var movie: Movie
    @State private var selectedBanner: PhotosPickerItem?
    @State private var bannerData: Data?
    @Binding var path: NavigationPath
    @Environment(\.modelContext) var modelContext
    
    init(movie: Movie? = nil, path: Binding<NavigationPath>) {
        self.movie = movie ?? Movie()
        self._path = path
    }
    
    var body: some View {
        VStack {
            form
            saveButton
        }
    }
    
    // MARK: - Form
    var form: some View {
        Form {
            Section("Title") {
                TextField("Name", text: $movie.title)
            }
            Section("Rating and duration") {
                TextField("Rating", value: $movie.rating, format: .number)
                TextField("Duration", text: $movie.duration)
            }
            Section("Categories") {
                TextField("Categories", text: $movie.categories)
            }
            Section("Synopsis") {
                TextEditor(text: $movie.summary)
                    .frame(height: 120)
            }
            Section("Banner") {
                PhotosPicker(selection: $selectedBanner) {
                    Label("Select the banner", systemImage: "photo")
                }
                if let bannerData,
                   let uiImage = UIImage(data: bannerData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
        .listSectionSpacing(3)
        .navigationTitle(movie.title)
        .onChange(of: selectedBanner) { oldValue, newValue in
            Task {
                bannerData = try await selectedBanner?.loadTransferable(type: Data.self)
                movie.image = bannerData
            }
        }
    }
    
    // MARK: - Save Button
    var saveButton: some View {
        Button {
            modelContext.insert(movie)
            path.removeLast()
        } label: {
            Text("Save")
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    MovieFormView(
        movie: Movie(
            title: "The Matrix",
            categories: "Action, Sci-Fi",
            duration: "2h 16m",
            rating: 7.9,
            summary: "A hacker discovers the true nature of reality and his role in a war against its controllers.",
            image: nil
        ),
        path: .constant(NavigationPath())
    )
}
