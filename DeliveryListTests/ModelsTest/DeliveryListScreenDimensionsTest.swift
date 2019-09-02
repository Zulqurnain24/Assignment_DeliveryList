//
//  DeliveryListScreenDimensionsTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 03/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryListScreenDimensionsTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDelivery() {
        XCTAssertNotNil(ScreenDimensions.self)
        XCTAssertTrue(ScreenDimensions.height > 0)
        XCTAssertTrue(ScreenDimensions.width > 0)
    }
}
