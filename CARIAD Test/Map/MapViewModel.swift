//
//  MapViewModel.swift
//  CARIAD Test
//
//  Created by Aymen Ben Farhat on 18/2/2023.
//

import Foundation
import MapKit

class MapViewModel: ObservableObject {
    
    @Published var onButtonTapped: Bool = false
    @Published var location: ChargingPoint?
    
    func openPinTapped(_ location: ChargingPoint) {
        self.location = location
        onButtonTapped = true
    }
}
