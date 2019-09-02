//
//  DeliveryListEndpointTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 03/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryListEndpointTest: XCTestCase {

    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testEndpoint() {
        XCTAssertEqual(baseUrl, "https://mock-api-mobile.dev.lalamove.com/")
         XCTAssertEqual(Endpoint.deliveries.rawValue, "deliveries")
    }
}
