//
//  ChargingPoint.swift
//  CARIAD Test
//
//  Created by Aymen Ben Farhat on 18/2/2023.
//

import Foundation

struct ChargingPoint: Codable, Identifiable, Equatable {
    
    
    let id = UUID()
    var adressInfo: AdressInfo
    var numberOfChargingPoints: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case adressInfo = "AddressInfo"
        case numberOfChargingPoints = "NumberOfPoints"
    }
}
