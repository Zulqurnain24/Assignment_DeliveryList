//
//  DeliveryListDeliveryTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 03/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryListDeliveryTest: XCTestCase {
    
    var sut: Delivery!
    
    override func setUp() {
        super.setUp()
        sut = Delivery(id: 0, description: "test description", imageUrl: "placeHolder", location: Location(lat: 0.0, lng: 0.0, address: "Test Address"))
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDelivery() {
        XCTAssertNotNil(sut)
      
        XCTAssertEqual( sut.id, 0)
        XCTAssertEqual( sut.imageUrl, "placeHolder")
        XCTAssertEqual( sut.location, Location(lat: 0.0, lng: 0.0, address: "Test Address"))
        XCTAssertEqual( sut.description, "test description")
    }
}
