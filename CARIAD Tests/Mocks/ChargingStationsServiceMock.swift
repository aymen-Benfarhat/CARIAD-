//
//  ChargingStationsServiceMock.swift
//  CARIAD TestTests
//
//  Created by Aymen Ben Farhat on 19/2/2023.
//

import Foundation
import Combine
import Alamofire

@testable import CARIAD_Test

class ChargingStationsServiceMock: ChargingStationsServiceProtocol {

    // MARK: - getChargingStations

    var invokedGetChargingStationsCount = 0
    var invokedGetChargingStations: Bool {
        return invokedGetChargingStationsCount > 0
    }
    var stubbedGetChargingStationsResult: AnyPublisher<[ChargingPoint], Never>!
    var getChargingStationsClosure: (() -> AnyPublisher<[ChargingPoint], Never>)?

    func getChargingStations() -> AnyPublisher<[ChargingPoint], Never> {
        invokedGetChargingStationsCount += 1
        return stubbedGetChargingStationsResult
    }

}

