//
//  MapView.swift
//  MoviesLib
//
//  Created by Vinicius Alves Beló on 15/02/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var locationManager = CLLocationManager()
    @State private var searchText: String = ""
    @State private var selectedPOI: MKMapItem?
    @State private var pointsOfInterest: [MKMapItem] = []
    @State private var visibleRegion: MKCoordinateRegion?
    @State private var route: MKRoute?
    
    var body: some View {
        NavigationStack {
            // POI: Points of Interest
            Map(position: $position, selection: $selectedPOI){
                UserAnnotation()
                
                ForEach(pointsOfInterest, id: \.self) { poi in
                    Marker(item: poi)
                }
                
                if let route {
                    MapPolyline(route)
                        .stroke(.purple, lineWidth: 7)
                        .mapOverlayLevel(level: .aboveRoads)
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
            .onChange(of: selectedPOI) {
                getDirections()
            }
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
    
    private func getDirections() {
        route = nil
        guard let sourceCoordinate = locationManager.location?.coordinate,
              let destination = selectedPOI
        else { return }
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceCoordinate))
        request.destination = destination
        
        let directions = MKDirections(request: request)
        Task {
            let response = try? await directions.calculate()
            let route = response?.routes.first
            
            withAnimation {
                position = .camera(MapCamera(centerCoordinate: sourceCoordinate,
                                             distance: 400,
                                             heading: 0,
                                             pitch: 45
                                            ))
            }
            
            self.route = route
        }
    }
}

#Preview {
    MapView()
}
