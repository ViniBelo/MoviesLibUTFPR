//
//  MapView.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 15/02/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var position: MapCameraPosition = .automatic
    @State private var locationManager = CLLocationManager()
    @State private var searchText: String = ""
    @State private var selectedPOI: MKMapItem?
    @State private var pointsOfInterest: [MKMapItem] = []
    @State private var visibleRegion: MKCoordinateRegion?
    
    private let utfpr = CLLocationCoordinate2D(latitude: -26.1976857, longitude: -52.6901529)
    
    var body: some View {
        NavigationStack {
            // POI: Points of Interest
            Map(position: $position, selection: $selectedPOI){
//                Marker("UTFPR", systemImage: "building.2.fill", coordinate: utfpr)
                UserAnnotation()
                
                ForEach(pointsOfInterest, id: \.self) { poi in
                    Marker(item: poi)
                }
            }
            .mapControls {
                MapUserLocationButton()
                MapCompass()
                MapScaleView()
            }
            .onAppear {
                locationManager.requestWhenInUseAuthorization()
                position = .automatic
            }
            .searchable(text: $searchText)
            .navigationTitle("Map")
            .onMapCameraChange { context in
                visibleRegion = context.region
            }
            .onSubmit(of: .search, searchForPOI)
        }
    }
    
    private func searchForPOI() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = visibleRegion ?? MKCoordinateRegion()
        let search = MKLocalSearch(request: request)
        
        Task {
            guard let response = try? await search.start() else { return }
            pointsOfInterest = response.mapItems
            position = .automatic
        }
    }
}

#Preview {
    MapView()
}
