//
//  ContentView.swift
//  CARIAD Test
//
//  Created by Aymen Ben Farhat on 18/2/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            if let chargingPoints = viewModel.chargingPoints {
                MapView(locations: chargingPoints)
            }
        }.onAppear {
            viewModel.loadData()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
