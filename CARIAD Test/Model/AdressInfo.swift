//
//  AdressInfo.swift
//  CARIAD Test
//
//  Created by Aymen Ben Farhat on 18/2/2023.
//

import Foundation
import CoreLocation

struct AdressInfo: Codable, Equatable {
    
    var title: String
    var adressLine1: String
    var adressLine2: String?
    var latitude: Double
    var longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case adressLine1 = "AddressLine1"
        case adressLine2 = "AddressLine2"
        case latitude = "Latitude"
        case longitude = "Longitude"
    }
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
