//
//  DetailsView.swift
//  CARIAD Test
//
//  Created by Aymen Ben Farhat on 18/2/2023.
//

import SwiftUI

struct DetailsView: View {
     @Binding var details: ChargingPoint?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Text("Station Name:")
                Text(details?.adressInfo.title ?? "")
            }
            
            HStack(spacing: 10) {
                Text("Station Adress:")
                Text(details?.adressInfo.adressLine1 ?? "")
            }
            
            HStack(spacing: 10) {
                Text("Number of Charging Points available:")
                if let numberOfChargingStations = details?.numberOfChargingPoints {
                    Text(String(numberOfChargingStations))
                } else {
                    Text("No Charging Points available at the Moment")
                }
            }
        }.padding(.leading, 20)
    }
}
