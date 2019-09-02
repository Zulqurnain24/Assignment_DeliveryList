//
//  DeliveryListReachabilityTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 03/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryListReachabilityTest: XCTestCase {

    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testReachability() {
        XCTAssertNotNil(Reachability.self)
        XCTAssertEqual(Reachability.isConnectedToNetwork(), true)
    }
}
