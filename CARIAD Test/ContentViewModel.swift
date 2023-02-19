//
//  ContentViewModel.swift
//  CARIAD Test
//
//  Created by Aymen Ben Farhat on 18/2/2023.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var chargingPoints: [ChargingPoint]?
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private let chargingStationsService: any ChargingStationsServiceProtocol
    
    var timer = Timer()
    
    init(
        chargingStationsService: any ChargingStationsServiceProtocol = resolve()
    ){
        self.chargingStationsService = chargingStationsService
        self.reLoadDataEvery30Second()
    }
    
    func loadData() {
        chargingStationsService.getChargingStations().sink{  result in
            self.chargingPoints = result
        }.store(in: &cancellableSet)
    }
    
    func reLoadDataEvery30Second() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true, block: { _ in
            self.loadData()
            })
    }
}
