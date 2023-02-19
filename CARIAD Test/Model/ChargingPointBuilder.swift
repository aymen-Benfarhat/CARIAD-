//
//  ChargingPointBuilder.swift
//  CARIAD TestTests
//
//  Created by Aymen Ben Farhat on 19/2/2023.
//

import Foundation

struct ChargingPointBuilder {

    var adressInfo: AdressInfo
    var numberOfChargingPoints: Int? = 1
    
    func build() -> ChargingPoint {
       ChargingPoint(adressInfo: adressInfo,
                     numberOfChargingPoints: numberOfChargingPoints)
        
    }
}
