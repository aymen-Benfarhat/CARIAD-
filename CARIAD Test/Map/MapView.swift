//
//  MapView.swift
//  CARIAD Test
//
//  Created by Aymen Ben Farhat on 18/2/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var locations: [ChargingPoint]
    
    @StateObject private var viewModel = MapViewModel()
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.526, longitude: 13.415),
                                           latitudinalMeters: 500,
                                           longitudinalMeters: 500)
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .all, annotationItems: locations, annotationContent: { location in
            MapAnnotation(coordinate: location.adressInfo.coordinate) {
                markerPoint(location)
            }
        })
    }
    
    private func markerPoint(_ location: ChargingPoint) -> some View {
        VStack(spacing: 0) {
            Image(decorative: "icon-page-location")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.bottom, 8)
            Circle()
                .frame(width: 5, height: 5)
                .padding(.bottom, 5)
    
        }.onTapGesture {
            viewModel.openPinTapped(location)
        }
        .sheet(isPresented: $viewModel.onButtonTapped) {
            DetailsView(details: $viewModel.location)
                .presentationDetents([.height(300)])
                .presentationDragIndicator(.visible)
        }
    }
}
