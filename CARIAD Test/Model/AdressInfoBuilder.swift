//
//  AdressInfoBuilder.swift
//  CARIAD Test
//
//  Created by Aymen Ben Farhat on 19/2/2023.
//

import Foundation

struct AdressInfoBuilder {
    var title: String = ""
    var adressLine1: String = ""
    var adressLine2: String?
    var latitude: Double = 52.526
    var longitude: Double = 13.415
   
    
    func build() -> AdressInfo {
        AdressInfo(title: title,
                   adressLine1: adressLine1,
                   adressLine2: adressLine2,
                   latitude: latitude,
                   longitude: longitude)
    }
}
