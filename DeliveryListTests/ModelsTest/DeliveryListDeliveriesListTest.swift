//
//  DeliveryListDeliveriesListTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryListDeliveriesListTest: XCTestCase {
    
    var sut: DeliveriesList!
    
    override func setUp() {
        super.setUp()
        sut = DeliveriesList()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDeliveries() {
        XCTAssertNotNil(sut.deliveries)
        sut.deliveries.append(Delivery(id: 0, description: "Test Description", imageUrl: "placeHolder", location: Location(lat: 0.0, lng: 0.0, address: "Test Address")))
        XCTAssertEqual( sut.deliveries.count, 1)
        XCTAssertEqual( sut.deliveries.first?.id, 0)
        XCTAssertEqual( sut.deliveries.first?.imageUrl, "placeHolder")
        XCTAssertEqual( sut.deliveries.first?.location, Location(lat: 0.0, lng: 0.0, address: "Test Address"))
        sut.deliveries.removeAll()
        XCTAssertEqual( sut.deliveries.count, 0)
    }
}
