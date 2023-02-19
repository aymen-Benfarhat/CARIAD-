//
//  ContentViewModelTests.swift
//  CARIAD TestTests
//
//  Created by Aymen Ben Farhat on 19/2/2023.
//

import XCTest
import Combine
import Alamofire

@testable import CARIAD_Test

class ContentViewModelTests: XCTestCase {
    
    private var chargingServiceMock: ChargingStationsServiceMock!
    
    override func setUp() {
        chargingServiceMock = ChargingStationsServiceMock()
    }
    
    private func makeViewModel() -> ContentViewModel {
        ContentViewModel(chargingStationsService: chargingServiceMock)
    }
    
    func test_should_load_charging_points_from_endpoint() {
        // arrange
        let viewModel = makeViewModel()
        let adressInfo = AdressInfoBuilder(title: "test Station").build()
        let chargingPoint = ChargingPointBuilder(adressInfo: adressInfo).build()
        chargingServiceMock.stubbedGetChargingStationsResult = CurrentValueSubject<[ChargingPoint], Never>([chargingPoint]).eraseToAnyPublisher()
        // act
        viewModel.loadData()
        // assert
        XCTAssertEqual(viewModel.chargingPoints, [chargingPoint])
    }
    
    func test_should_reload_data_every_30_second() {
        // arrange
        let viewModel = makeViewModel()
        let adressInfo = AdressInfoBuilder(title: "test Station").build()
        let chargingPoint = ChargingPointBuilder(adressInfo: adressInfo).build()
        let expectation = expectation(description: "Data was reloaded")
        chargingServiceMock.stubbedGetChargingStationsResult = CurrentValueSubject<[ChargingPoint], Never>([chargingPoint]).eraseToAnyPublisher()
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            expectation.fulfill()
        }
        // act
        viewModel.reLoadDataEvery30Second()
        // assert
        wait(for: [expectation], timeout: 32)
    }
    
}
