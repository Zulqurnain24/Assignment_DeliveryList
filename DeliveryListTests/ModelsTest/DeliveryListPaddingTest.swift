//
//  DeliveryListPaddingTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 03/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryListPaddingTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDelivery() {
        XCTAssertNotNil(Padding.self)
        XCTAssertEqual( Padding.standard, 30.0)
    }
}
