//
//  MapViewModelTests.swift
//  CARIAD TestTests
//
//  Created by Aymen Ben Farhat on 19/2/2023.
//

import XCTest

@testable import CARIAD_Test

class MapViewModelTests: XCTestCase {
    
    override func setUp() {}
    
    private func makeViewModel() -> MapViewModel {
        MapViewModel()
    }
    
    func test_should_open_sheet_and_pass_data_when_pin_is_clicked() {
        // arrange
        let viewModel = makeViewModel()
        let adressInfo = AdressInfoBuilder(title: "test Station").build()
        let chargingPoint = ChargingPointBuilder(adressInfo: adressInfo).build()
        // act
        viewModel.openPinTapped(chargingPoint)
        // assert
        XCTAssertTrue(viewModel.onButtonTapped)
    }
}
