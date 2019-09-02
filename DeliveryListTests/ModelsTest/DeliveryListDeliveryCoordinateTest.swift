//
//  DeliveryTestDeliveryCoordinateTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 03/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryListDeliveryCoordinateTest: XCTestCase {
    
    var sut: DeliveryCoordinate!
    
    override func setUp() {
        super.setUp()
        sut = DeliveryCoordinate(name: "Test Coordinate", lat: 0.0, long: 0.0)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDeliveryCoordinate() {
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.title, "Test Coordinate")
        XCTAssertEqual(sut.coordinate.latitude, 0.0)
        XCTAssertEqual(sut.coordinate.longitude, 0.0)
    }
}
