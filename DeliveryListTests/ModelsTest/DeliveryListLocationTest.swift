//
//  DeliveryListLocationTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 03/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryListLocationTest: XCTestCase {
    
    var sut: Location!
    
    override func setUp() {
        super.setUp()
        sut = Location(lat: 0.0, lng: 0.0, address: "Test Address")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDelivery() {
        XCTAssertNotNil(sut)
        
        XCTAssertEqual( sut.address, "Test Address")
        XCTAssertEqual( sut.lat, 0.0)
        XCTAssertEqual( sut.lng, 0.0)
    }
}
