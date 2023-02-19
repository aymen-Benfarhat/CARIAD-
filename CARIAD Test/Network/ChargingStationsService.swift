//
//  ChargingStationsService.swift
//  CARIAD Test
//
//  Created by Aymen Ben Farhat on 18/2/2023.
//

import Foundation
import Combine
import Alamofire


protocol ChargingStationsServiceProtocol {
    func getChargingStations() -> AnyPublisher<[ChargingPoint], Never>
}

struct ChargingStationsService: ChargingStationsServiceProtocol {
    
    func getChargingStations() -> AnyPublisher<[ChargingPoint], Never> {
        let url = URL(string: "https://api.openchargemap.io/v3/poi?latitude=52.526&longitude=13.415&distance=5")!
               let headers = HTTPHeaders(["X-API-Key" :"1e2cb9c6-a0e9-4a68-bc09-f3c97a6bd8e4"])
        
        // Force Unwrapping is Dangerous but considering this test has a time frame it was used here
        let request = try! URLRequest(url: url, method: .get, headers: headers)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map({$0.data})
            .decode(type: [ChargingPoint].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}


